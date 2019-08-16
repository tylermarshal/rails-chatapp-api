class ChatRoom < ApplicationRecord
  has_many :chat_rooms_users
  has_many :users, through: :chat_rooms_users
  has_many :messages

  scope :sort_by_title, -> { order(title: :asc) }

  validates :title, uniqueness: true
end
