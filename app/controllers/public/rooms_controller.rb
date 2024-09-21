class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
  end


  def new
    @room = Room.new
  end
  
  def create
    user_id = params[:user_id]
    @rooms = current_user.rooms
    @room = Room.includes(:room_users).find_by(id: @rooms, room_users: { user_id: user_id })
    if @room == nil
    @room = Room.new(user_ids: [current_user.id, user_id])
    @room.save
    end
    redirect_to public_room_messages_path(@room)
  end
  
  def destroy
    room = Room.find(params[:id])
    if room.destroy
      flash[:notice] = "ルームを削除しました。"
      redirect_to public_rooms_path
    end
  end

  private

  def room_params
  params.permit(user_ids: [])
  end
end