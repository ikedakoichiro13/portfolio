class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to public_posts_path
  end

  def index 
    @coats = Coat.all 
    @posts = if params[:coat_id].present? 
    Post.joins(:post_coats).where(post_coats: { coat_id: params[:coat_id] }) 
    else 
    Post.all 
    end 
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to public_posts_path
  end

  private

  def post_params
    params.permit(:dogcat, :title, :kinds, :age, :gender, :health_condition, :vaccination, :infertility_treatment, :features, :transfer_condition, :recruitment_area, images: [], coat_ids: [])
  end
end
