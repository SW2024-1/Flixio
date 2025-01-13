class ListsController < ApplicationController
  def show
    @listitems = Listitem.where(list_id: current_list.id)
  end

  def create
    l = Listitem.new(list_item_params.merge(list_id: current_list.id, user_id: current_user.id))
    if l.save
      redirect_to products_path
    else
      redirect_to new_listitem_path(product_id: l.product_id)
    end
  end

  def list_item_params
    params.require(:list_item).permit(:product_id)
  end

  def destroy
    Listitem.find(params[:id]).destroy
    redirect_to list_path(current_list.id), notice: 'アイテムが削除されました。'
  end
end
