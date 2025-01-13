class ProductsController < ApplicationController
  def index
    @products = Product.all
    @users = current_user
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
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    product = Product.find(params[:id])
    # ActiveStorageの関連を削除
    product.active_storage_attachments.destroy_all if product.respond_to?(:active_storage_attachments)
    # 商品を削除
    product.destroy
    redirect_to products_path
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  
  def get_video
    @product = Product.find(params[:id])
    send_data @product.file, disposition: :inline, type: 'video/mp4'
  end 
  
  
  private
  def product_params
    params.require(:product).permit(:name)
  end

end