FactoryBot.define do
  factory :review do
    reviews_title { "test-title" }
    instrument_name { "test"}
    store_price { "1234" }
    score { "1234"}
    store_reviews { "test-review" }    
  end
end
