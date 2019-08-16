require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(build(:message)).to be_valid
  end

  describe 'associations' do
    it { should belong_to(:sender) }
    it { should belong_to(:chat_room) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end