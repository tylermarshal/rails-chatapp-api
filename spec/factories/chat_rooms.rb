FactoryBot.define do
  factory :chat_room do
    title { Faker::Games::Pokemon.name }
  end
end