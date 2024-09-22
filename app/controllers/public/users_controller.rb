class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @post = Post.find(@user.posts.ids)
    if @favorite_posts.empty?
      @no_favorite_message = "いいねした投稿がありません"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
