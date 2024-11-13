class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    name = params[:product][:name]
    price = params[:product][:price]
    file = params[:product][:file].read
    p = Product.new(name: name, price: price, file: file)
    p.save
    redirect_to products_path
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end
  
  def get_video
    @product = Product.find(params[:id])
    send_data @product.file, disposition: :inline, type: 'video/mp4'
  end 
  
end