# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "test", email: "test@example", password: "testpass")
Store.create!(user_id: 1, name: "株式会社ダク", address: "東京都", nearest_station: "新大久保駅")
Store.create!(user_id: 1, name: "株式会社グローバル", address: "東京都", nearest_station: "新大久保駅")
Store.create!(user_id: 1, name: "Tuba88", address: "東京都", nearest_station: "大久保駅")
Store.create!(user_id: 1, name: "ドルチェ楽器東京アヴェニュー", address: "東京都", nearest_station: "新宿駅")
Store.create!(user_id: 1, name: "下倉楽器お茶の水店", address: "東京都", nearest_station: "お茶の水駅")
Store.create!(user_id: 1, name: "山野楽器ワルツ所沢店", address: "埼玉県", nearest_station: "所沢駅")
Store.create!(user_id: 1, name: "ドルチェ楽器大阪店", address: "大阪府", nearest_station: "大阪駅")
Store.create!(user_id: 1, name: "セントラル楽器", address: "神奈川県", nearest_station: "東白楽駅")
Store.create!(user_id: 1, name: "黒崎楽器", address: "徳島県", nearest_station: "徳島駅")
Store.create!(user_id: 1, name: "共音楽器", address: "徳島県", nearest_station: "佐古駅")
Store.create!(user_id: 1, name: "ジャパンチューバセンター", address: "北海道", nearest_station: "篠路駅")
Review.create!(store_id: 1, user_id: 1, reviews_title: "楽器修理、調整", instrument_name: "Trumpet", store_price: 5000,
  score: 5, store_reviews: "とても丁寧に対応してくれた。試奏室も多くアポ無しでも思想できる。")
Review.create!(store_id: 1, user_id: 1, reviews_title: "楽器修理、調整", instrument_name: "Trombone", store_price: 4000,
  score: 4, store_reviews: "いい店でした。地下にコンサートスペースがある。教本もいっぱいある。")
Review.create!(store_id: 2, user_id: 1, reviews_title: "楽器修理、調整", instrument_name: "Tuba", store_price: 8000,
  score: 5, store_reviews: "輸入代理店、連絡が取りずらいが、修理技術は高く割安。")
Review.create!(store_id: 4, user_id: 1, reviews_title: "消耗品購入", instrument_name: "Clarinet", store_price: 1000,
  score: 4, store_reviews: "リード購入。新宿のビル中にある。コンサートスペース、音楽教室が併設されている。")
Review.create!(store_id: 5, user_id: 1, reviews_title: "消耗品購入", instrument_name: "Tuba", store_price: 600,
  score: 4, store_reviews: "バルブオイル購入。時々中古品で掘り出し物がある。")
