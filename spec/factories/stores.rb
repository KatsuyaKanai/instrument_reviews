FactoryBot.define do
  factory :store do
    name { "teststore" }
    address { "東京都" }
    nearest_station { "test-station" }
    user_id { "1" }
  end
end
