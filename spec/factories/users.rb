FactoryBot.define do
  factory :user do
    name { "testman" }
    email { "testman@example.com" }
    password { "testmanpassword" }
    password_confirmation { "testmanpassword" }
  end
end
