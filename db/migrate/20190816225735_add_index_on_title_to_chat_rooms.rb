class AddIndexOnTitleToChatRooms < ActiveRecord::Migration[6.0]
  def change
    add_index :chat_rooms, :title, unique: true
  end
end
