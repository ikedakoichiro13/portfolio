class Public::PostsController < ApplicationController
  before_action :authenticate_user!

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
    # coatを別に保存しておく
    params.permit(:title, :kinds, :age, :gender, :health_condition, :vaccination, :infertility_treatment, :features, :transfer_condition, :recruitment_area, images: [], coat_attributes: [:name])
  end
end
