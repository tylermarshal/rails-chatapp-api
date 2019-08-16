FactoryBot.define do
  factory :user do
    email { "joe@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end