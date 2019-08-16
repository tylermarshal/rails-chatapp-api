class CreateChatRoomsUser < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true
    end
  end
end
