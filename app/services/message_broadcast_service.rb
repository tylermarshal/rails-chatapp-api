class MessageBroadcastService
  def self.call(message)
    new(message).call
  end

  def initialize(message)
    @message = message
    @sender = message.sender
  end

  def call
    broadcast
  end

  private

  attr_reader :message, :sender


  def broadcast
    ActionCable.server.broadcast("chat_rooms_#{message.chat_room.id}_channel", payload)
  end

  def payload
    {
      chat_room_id: message.chat_room_id,
      content: message.content,
      sender: {
        id: sender.id,
        token: sender.token,
        email: sender.email
      }
    }
  end
end