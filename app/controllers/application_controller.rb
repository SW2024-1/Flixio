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
          if session[:list_id]
            list = List.find(session[:list_id])
          else
            list = List.create
            session[:list_id] = list.id
          end
          list
  end
end