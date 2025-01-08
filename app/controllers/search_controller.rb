class SearchController < ApplicationController
    
  def search
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]
    if search_params_invalid?
      flash[:error] = "Invalid search parameters. Please try again."
      redirect_to root_path and return
    end
    @products = Product.looks(params[:search], params[:word])

  end
  
  def results
    @range = params[:range]
    @search = params[:search]
    @word = params[:word]
    if search_params_invalid?
      flash[:error] = "Invalid search parameters. Please try again."
      redirect_to root_path and return
    end
    @products = Product.looks(params[:search], params[:word])
  end
  private

  def search_params_invalid?
    # search と word が空でないことを確認
    (@search.blank? || @word.blank?) || !['name', 'description', 'category'].include?(@search)
  end
end
