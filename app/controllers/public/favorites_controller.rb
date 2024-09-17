class Public::FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    redirect_to public_post_path(post)
  end
  
end
