class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      chat_room_id: message.chat_room_id,
      content: message.content,
      user: message.user
    }
    ActionCable.server.broadcast("chat_rooms_#{message.chat_room.id}_channel", payload)
  end
end