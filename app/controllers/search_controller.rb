class SearchController < ApplicationController
    
  def search
    @range = params[:range]
    @products = Product.looks(params[:search], params[:word])
  end
  
  def results
    @range = params[:range]
    @products = Product.looks(params[:search], params[:word])
  end
end