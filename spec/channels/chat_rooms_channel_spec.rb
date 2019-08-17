require 'rails_helper'

RSpec.describe ChatRoomsChannel, type: :channel do
  let!(:user) { FactoryBot.create(:user) }
  let!(:chat_room) { FactoryBot.create(:chat_room) }

  before do
    stub_connection current_user: user
  end

  describe 'chat_room_id not provided' do
    before do
      subscribe
    end

    it 'rejects subscription' do
      expect(subscription).to be_rejected
    end
  end

  describe 'chat_room_id provided' do
    before do
      subscribe(chat_room_id: chat_room.id)
    end
    
    it 'confirms subscription' do
      expect(subscription).to be_confirmed
    end

    it 'has stream for existing channel' do
      expect(subscription).to have_stream_from("chat_rooms_#{chat_room.id}_channel")
    end
  end
end