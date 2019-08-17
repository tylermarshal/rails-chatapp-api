class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    chat_room = ChatRoom.find_by(id: params[:chat_room_id])
    if chat_room.present?
      stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    else
      connection.transmit(error: "Chat room does not exist.")
      reject
    end
  end

  def send_message(data)
    chat_room_id   = data['chat_room_id']
    content   = data['content']

    current_user.messages.create!(content: content, chat_room_id: chat_room_id)
  end
end