
require 'rails_helper'

RSpec.describe 'POST /chat_rooms', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let(:url) { '/chat_rooms' }
  
  before do
    sign_in user
  end

  context 'success' do
    before do
      post url, params: { chat_room: params }
    end

    let(:params) { { title: Faker::TvShows::GameOfThrones.dragon } }

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'creates the chat room' do
      expect(ChatRoom.last.title).to eq(params[:title])
    end
  end

  context 'failure' do
    context 'validations' do
      let!(:chat_room) { FactoryBot.create(:chat_room, title: Faker::TvShows::GameOfThrones.dragon) }

      let(:params) { { title: chat_room.title } }

      before do
        post url, params: { chat_room: params }
      end

      it 'returns 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(JSON.parse(response.body)['errors']['title'].first).to eq('has already been taken')
      end
    end
  end
end