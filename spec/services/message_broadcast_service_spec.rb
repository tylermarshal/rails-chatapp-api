require 'rails_helper'

RSpec.describe MessageBroadcastService do
  describe "broadcast" do
    let!(:message) { FactoryBot.create(:message) }
    let(:sender) { message.sender }

    it 'succeeds' do
      payload = {
        chat_room_id: message.chat_room_id,
        content: message.content,
        sender: {
          id: sender.id,
          token: sender.token,
          email: sender.email
        }
      }
      expect { described_class.call(message) }.to have_broadcasted_to("chat_rooms_#{message.chat_room.id}_channel").with(payload)
    end
  end
end