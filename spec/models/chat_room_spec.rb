require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it 'has a valid factory' do
    expect(build(:chat_room)).to be_valid
  end

  describe 'associations' do
    it { should have_many(:chat_rooms_users) }
    it { should have_many(:users).through(:chat_rooms_users) }
    it { should have_many(:messages) }
  end
end