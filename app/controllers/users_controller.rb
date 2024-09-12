class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find_by(id: params[:id])
    @current_entry = Entry.where(user_id: current_user.id)
    @another_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_entry.each do |current|
        @another_entry.each do |another|
          if current.room_id == another.room_id
            @is_room = true
            @room_id = current.room_id
          end
        end
      end
      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(2)
    @like_posts = @user.likes.order(created_at: :desc).page(params[:page]).per(2)
    @repost_posts = @user.reposts.order(created_at: :desc).page(params[:page]).per(2)
    @comment_posts = @user.comments.order(created_at: :desc).page(params[:page]).per(3)
  end
end
