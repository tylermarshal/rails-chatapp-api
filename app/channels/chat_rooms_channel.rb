class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel" if params['chat_room_id'].present?
  end

  def send_message(data)
    chat_room_id   = data['chat_room_id']
    content   = data['content']

    current_user.messages.create!(content: content, chat_room_id: chat_room_id)
  end
end