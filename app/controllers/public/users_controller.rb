class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.user.update(user_params)
    redirect_to public_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
