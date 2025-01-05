class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @users = User.all
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: '管理者権限が必要です' unless current_user&.admin?
  end
end
