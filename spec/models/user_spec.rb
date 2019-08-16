require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:chat_rooms_users) }
    it { should have_many(:chat_rooms).through(:chat_rooms_users) }
  end
end