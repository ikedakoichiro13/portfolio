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
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :kinds, :age, :gender, :coat, :health_condition, :vaccination, :infertility_treatment, :features, :transfer_condition, :recruitment_area)
  end
end
