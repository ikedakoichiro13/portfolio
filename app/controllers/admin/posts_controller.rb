class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_user_path(@post.user_id), notice: '投稿を削除しました'
  end
end
