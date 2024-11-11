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
    redirect_to root_path
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to root_path
  end
  
  def get_image
    image = Image.find(params[:id])
    send_data image.file, disposition: :inline, type: 'image/png'
  end 
  
end