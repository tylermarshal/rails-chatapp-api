FactoryBot.define do
  factory :message do
    content { Faker::Quote.most_interesting_man_in_the_world }
    association :sender, factory: :user
    association :chat_room, factory: :chat_room
  end
end