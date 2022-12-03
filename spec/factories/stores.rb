FactoryBot.define do
  factory :store do
    sequence(:name, "testshop_1")
    address { "test-prefecture" }
    nearest_station { "test-station" }
    user_id { "1" }
  end
end
