FactoryBot.define do
  factory :user do
    username { "Joe" }
    email { "joe@gmail.com" }
    password { "password" }
    password_conifrmation { "password" }
  end
end