class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_list

  private

  def current_user
    if session[:login_uid]
      User.find_by(uid: session[:login_uid])
    end
  end
  def current_list
    # セッションから list_id を取得
    if session[:list_id]
      # list_id が存在する場合、その id に対応する List を検索
      list = List.find_by(id: session[:list_id])
  
      # もし List が見つからなければ、新しく作成
      if list.nil?
        list = List.create
        session[:list_id] = list.id # 新しい List の id をセッションに保存
      end
    else
      # session[:list_id] がない場合は新しい List を作成
      list = List.create
      session[:list_id] = list.id # 新しい List の id をセッションに保存
    end
    return list
  end
end