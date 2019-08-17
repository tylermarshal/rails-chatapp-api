require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  describe 'with current_user' do
    let!(:user) { FactoryBot.create(:user) }

    it 'it connects' do
      connect "/cable?token=#{user.token}"
      expect(connection.current_user).to eq(user)
    end
  end

  it 'rejects connection' do
    expect { connect '/cable' }.to raise_error(ActionCable::Connection::Authorization::UnauthorizedError)
  end
end