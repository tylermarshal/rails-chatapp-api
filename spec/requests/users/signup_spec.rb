require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq(:ok)
    end

    it 'returns a new user' do
      expect(JSON.parse(response.body)['id']).to eq(User.last.id)
    end
  end

  context 'when user already exists' do
    let!(:user) { FactoryBot.create(:user, email: params[:user][:email]) }
    
    before do
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq(:bad_request)
    end

    it 'returns validation errors' do
      expect(JSON.parse(response.body)['errors']['email'].first).to eq('has already been taken')
    end
  end
end