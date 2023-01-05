FactoryBot.define do
  factory :store do
    name { "teststore" }
    address { "東京都新宿区百人町1-1" }
    nearest_station { "test-station" }
    user_id { "1" }
  end
end
