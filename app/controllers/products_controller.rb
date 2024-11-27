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
    product = Product.new(name: name, price: price, file: file)
    product.save
    redirect_to products_path
  end
  
  def destroy
    product = Product.find(params[:id])
    # まず関連する watch_histories を削除
    product.watch_histories.destroy_all
    # product を削除
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
  
  def watch_video
    @product = Product.find(params[:id])
    WatchHistory.create(user: current_user, product: @product, watched_at: Time.now)
    
    redirect_to product_path(@product)  #product_video_path(@watch_history)
  end
  
end