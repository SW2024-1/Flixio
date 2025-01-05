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
    if @product.save
      redirect_to admin_products_path, notice: '商品が作成されました'
    else
      render :new
    end
  end
   
  def edit
    @product = Product.find(params[:id])
  end
   
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: '商品が更新されました'
    else
      render :edit
    end
  end
    
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: '商品が削除されました'
  end
    
  private
   
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
