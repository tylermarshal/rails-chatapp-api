class ChatRoomsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    chat_rooms = ChatRoom.sort_by_title
    render json: chat_rooms
  end

  def create
    chat_room = current_user.chat_rooms.build(chat_room_params)
    if chat_room.save
      render json: chat_room
    else
      render json: { errors: chat_room.errors }, status: :unprocessable_entity 
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end