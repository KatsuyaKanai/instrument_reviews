FactoryBot.define do
  factory :review do
    reviews_title { "楽器修理" }
    instrument_name { "Fagot" }
    store_price { "9999" }
    score { "4" }
    store_reviews { "test-review" }
    store_id { "1" }
    user_id { "1" }
  end
end
