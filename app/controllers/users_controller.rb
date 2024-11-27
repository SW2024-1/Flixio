class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    u = User.new(uid: params[:user][:uid], 
      password: params[:user][:password], 
      password_confirmation: params[:user][:password_confirmation]
    )
    u.save
    redirect_to users_path
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  def watch_history
    if current_user
      @watch_histories = current_user.watch_histories.includes(:product).order(watched_at: :desc)
    else
      redirect_to users_path, alert: 'ログインしてください'
    end
  end
end
