class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_path
  end

  def index
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :kinds, :age, :gender, :health_condition, :vaccination, :infertility_treatmen, :features :transfer_condition)
end
