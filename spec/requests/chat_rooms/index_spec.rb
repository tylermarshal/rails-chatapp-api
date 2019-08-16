
require 'rails_helper'

RSpec.describe 'GET /chat_rooms', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:chat_rooms) { FactoryBot.create_list(:chat_room, 3) }
  let(:url) { '/chat_rooms' }

  before do
    sign_in user
    get url
  end

  it 'returns 200' do
    expect(response).to have_http_status(:ok)
  end

  it 'returns all chat rooms sorted by title' do
    resp = JSON.parse(response.body).map { |c| c['title'] }
    result = ChatRoom.all.sort_by(&:title).map(&:title)
    expect(resp).to eq(result)
  end
end