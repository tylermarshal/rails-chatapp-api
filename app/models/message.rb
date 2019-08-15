class Message < ApplicationRecord
  belongs_to :sender, class_name: :User, foreign_key: 'sender_id'

  validates_presence_of :content
end
