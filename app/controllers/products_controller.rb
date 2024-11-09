class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    p = Product.new(name: params[:product][:name], price: params[:product][:price])
    p.save
    redirect_to root_path
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to root_path
  end
  
end