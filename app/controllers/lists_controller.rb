class ListsController < ApplicationController
  def show
    @listitems = Listitem.where(list_id: current_list.id)
  end
end