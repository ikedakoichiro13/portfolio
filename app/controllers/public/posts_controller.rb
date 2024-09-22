class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destory]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to public_posts_path
    else
      flash.now[:alert] = "※入力内容に誤り、または未入力の項目があります。"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to  public_post_path(post.id)
    else
      render :edit
    end
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
    if post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to public_user_path(current_user.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:dogcat, :title, :kinds, :age, :gender, :health_condition, :vaccination, :infertility_treatment, :features, :transfer_condition, :recruitment_area, images: [], coat_ids: [])
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url unless @post
  end
end
