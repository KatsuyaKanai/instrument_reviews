FactoryBot.define do
  factory :store do
    name { "teststore" }
    address { "東京都新宿区百人町1-1" }
    nearest_station { "test-station" }
    user_id { "1" }

    after(:build) do |store|
      store.image.attach(io: File.open("spec/fixtures/files/test_image.jpg"), filename: 'image.jpg')
    end
  end
end
