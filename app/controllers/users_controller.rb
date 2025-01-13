class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:user][:uid], 
      password: params[:user][:password], 
      password_confirmation: params[:user][:password_confirmation]
    )
    if @user.save
      flash[:alert] = 'アカウントを作成しました。'
      redirect_to top_main_path
    else
      # 保存失敗時、再度フォームを表示してエラーメッセージを表示
      flash[:alert] = 'アカウントを作成できませんでした。'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  

end
