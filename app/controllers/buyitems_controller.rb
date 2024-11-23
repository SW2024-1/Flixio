class BuyitemsController < ApplicationController
  def new
    @buyitem = Buyitem.new
    @product = Product.find(params[:product_id])  # 商品を取得
  end

  def create
    buyitem = Buyitem.new(buy_item_params.merge(list_id: current_list.id))  # 現在のリストIDを設定
    if buyitem.save
      redirect_to products_path  # 商品一覧ページにリダイレクト
    else
      redirect_to root_path  # 保存に失敗した場合、ルートページにリダイレクト
    end
  end

  def destroy
    Buyitem.find(params[:id]).destroy
    redirect_to buys_path, notice: "購入リストから商品が削除されました。"
  end
  
  private

  def buy_item_params
    params.require(:buyitem).permit(:product_id)  # 許可するパラメータ
  end
end
