FactoryBot.define do
  factory :store do
    name { "testshop" }
    address { "test-prefecture" }
    nearest_station { "test-station" }    
  end
end
