class ProductsController < ApplicationController
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
    # product_paramsでファイルを処理する
    @product = Product.new(product_params)
    
    # ファイルがアップロードされた場合、ActiveStorageに添付
    if params[:product][:file].present?
      @product.file.attach(params[:product][:file])
    end
    
    if params[:product][:thumbnail].present?
      @product.thumbnail.attach(params[:product][:thumbnail])
    end

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end
  
  def get_video
    @product = Product.find(params[:id])
    send_data @product.file, disposition: :inline, type: 'video/mp4'
  end 
  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end