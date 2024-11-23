class BuysController < ApplicationController
  def show
    @buyitems = Buyitem.where(list_id: current_list.id)  # 現在のリストに関連する購入アイテムを取得
  end
end
