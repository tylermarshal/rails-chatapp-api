FactoryBot.define do
  factory :message do
    content { Faker::Quote.most_interesting_man_in_the_world }
  end
end