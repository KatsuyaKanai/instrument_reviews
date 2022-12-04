FactoryBot.define do
  factory :store do
    sequence(:name, "testshop_1")
    address { "東京都" }
    nearest_station { "test-station" }
    user_id { "1" }
  end
end
