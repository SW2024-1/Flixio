class TopController < ApplicationController
    def main
        if session[:login_uid] 
            redirect_to products_path
        else
            render "login"
        end
    end
    
    def login
        # フォームから送信されたUIDとパスワードを検証
        if params[:uid].blank? || params[:pass].blank?
            flash.now[:alert] = "UID と パスワードを入力してください"
            render "login", status: 422
            return
        end

        user = User.find_by(uid: params[:uid])
        
        if user && BCrypt::Password.new(user.password_digest) == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to products_path
        else
            flash.now[:alert] = "UID または パスワードが無効です"
            render "login", status: 422
        end
    end
    
    def logout
        session.delete(:login_uid)
        redirect_to root_path
    end
end
