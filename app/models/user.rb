class User < ApplicationRecord
  devise :database_authenticatable,
          :registerable,
          :jwt_authenticatable,
          jwt_revocation_strategy: JwtBlacklist

  has_secure_token

  has_many :chat_rooms_users
  has_many :chat_rooms, through: :chat_rooms_users
  has_many :messages

  validates :email, uniqueness: true
end
