class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.all
  end
    
  def show
    @product = Product.find(params[:id])
  end
    
  def new
    @product = Product.new
  end
    
  def create
    @product = Product.new(product_params)
    # ファイルがアップロードされた場合、ActiveStorageに添付
    @product.file.attach(params[:product][:file]) if params[:product][:file].present?
    @product.thumbnail.attach(params[:product][:thumbnail]) if params[:product][:thumbnail].present?

    if @product.save
      redirect_to admin_products_path, notice: "商品が作成されました"
    else
      render :new, status: :unprocessable_entity
    end
  end
   
  def edit
    @product = Product.find(params[:id])
  end
   
  def update
    @product = Product.find(params[:id])

    # 既存の動画や画像を削除
    @product.file.purge if params[:product][:file].present? && @product.file.attached?
    @product.thumbnail.purge if params[:product][:thumbnail].present? && @product.thumbnail.attached?
    # 新しい動画や画像を添付
    file = params.dig(:product, :file)
    thumbnail = params.dig(:product, :thumbnail)
    
    @product.file.attach(file) if file.present?
    @product.thumbnail.attach(thumbnail) if thumbnail.present?
    
    if @product.update(product_params)
      flash[:notice] = "商品が更新されました"
      redirect_to admin_product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @product = Product.find(params[:id])
    # 添付ファイルの削除
    @product.file.purge if @product.file.attached?
    @product.thumbnail.purge if @product.thumbnail.attached?

    @product.destroy
    redirect_to admin_products_path, notice: "商品が削除されました"
  end
  
  def get_video
    @product = Product.find(params[:id])
    send_data @product.file.download, disposition: :inline, type: 'video/mp4'
  end 
  
  private
   
  def product_params
    params.require(:product).permit(:name, :file, :thumbnail)
  end
end
