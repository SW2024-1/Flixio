class ListitemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])  # product_idから商品を取得
  end
  def create
    l = Listitem.new(list_item_params.merge(list_id: current_list.id))
    if l.save
      redirect_to products_path
    else
      redirect_to root_path
    end
  end
  
  def list_item_params
    params.require(:list_item).permit(:product_id)
  end
  
  def destroy
    Listitem.find(params[:id]).destroy
    redirect_to list_path(current_list.id)
  end
end
