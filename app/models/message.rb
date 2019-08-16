class Message < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: 'sender_id'
  belongs_to :chat_room

  validates_presence_of :content

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
