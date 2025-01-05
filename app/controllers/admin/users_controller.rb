class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @listitems = @user.list&.listitems || []
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーが削除されました'
  end

  private

  def user_params
    params.require(:user).permit(:uid, :password, :admin)
  end
end
