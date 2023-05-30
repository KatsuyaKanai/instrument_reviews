require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "test", email: "test1@example", password: "testpass")
Store.create!(user_id: 1, name: "株式会社ダク", address: "東京都新宿区百人町2-8-9", nearest_station: "新大久保駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/dac.jpg"),filename: "dac.jpg"))
Store.create!(user_id: 1, name: "株式会社グローバル", address: "東京都新宿区百人町2-17-7", nearest_station: "新大久保駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/global.jpg"),filename: "global.jpg"))
Store.create!(user_id: 1, name: "Tuba88", address: "東京都新宿区北新宿1-13-16", nearest_station: "大久保駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/tuba88.jpg"),filename: "tuba88.jpg"))
Store.create!(user_id: 1, name: "ドルチェ楽器東京アヴェニュー", address: "東京都新宿区西新宿1-13-12西新宿昭和ビル8F", nearest_station: "新宿駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/dolcegakki.jpg"),filename: "dolcegakki.jpg"))
Store.create!(user_id: 1, name: "下倉楽器お茶の水店", address: "東京都千代田区神田駿河台2-2", nearest_station: "お茶の水駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/simokuragakki.jpg"),filename: "simokuragakki.jpg"))
Store.create!(user_id: 1, name: "山野楽器ワルツ所沢店", address: "埼玉県所沢市日吉町12-1 ワルツ所沢8F", nearest_station: "所沢駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/yamanogakki.jpg"),filename: "yamanogakki.jpg"))
Store.create!(user_id: 1, name: "ドルチェ楽器大阪店", address: "大阪府北区角田町2-7", nearest_station: "大阪駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/oosakadolce.jpg"),filename: "oosakadolce.jpg"))
Store.create!(user_id: 1, name: "セントラル楽器", address: "神奈川県横浜市神奈川区西神奈川1-15-2", nearest_station: "東白楽駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/centralgakki.jpg"),filename: "centralgakki.jpg"))
Store.create!(user_id: 1, name: "黒崎楽器", address: "徳島県徳島市通町1-18-1", nearest_station: "徳島駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/kurosakigakki.jpg"),filename: "kurosakigakki.jpg"))
Store.create!(user_id: 1, name: "共音楽器", address: "徳島県徳島市北矢三町4-1-25", nearest_station: "佐古駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/kyouongakki.jpg"),filename: "kyouongakki.jpg"))
Store.create!(user_id: 1, name: "ジャパンチューバセンター", address: "北海道札幌市北区篠路6条5-5-6", nearest_station: "篠路駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/japantubacenter.jpg"),filename: "japantubacenter.jpg"))
Store.create!(user_id: 1, name: "nero楽器", address: "東京都渋谷区渋谷1-6-2岩川ビル1F", nearest_station: "渋谷駅",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open("app/assets/images/nerogakki.jpg"),filename: "nerogakki.jpg"))
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
Review.create!(store_id: 1, user_id: 1, reviews_title: "その他", instrument_name: "Euphonium", store_price: 0,
  score: 5, store_reviews: "楽器購入を考えて考えて試奏しに行きました。お気に入りの楽器が見つからずに購入しませんでした。店員の方は横も丁寧な接客をしてくれました。")
Review.create!(store_id: 9, user_id: 1, reviews_title: "楽譜、アクセサリー購入", instrument_name: "Flute,Piccolo", store_price: 600,
  score: 4, store_reviews: "今度演奏するオーケストラのスコアを購入。そこそこ品揃えが良い。")
Review.create!(store_id: 5, user_id: 1, reviews_title: "その他", instrument_name: "その他", store_price: 0,
  score: 4, store_reviews: "下倉楽器主催の中学生の楽器別講習会に顧問として引率しました。楽器の状態が悪ければ講師の先生が教えてくださり、簡単な修理は会場に来ている下倉楽器のリペアスタッフが直してくれました。")
Review.create!(store_id: 1, user_id: 1, reviews_title: "楽器修理、調整", instrument_name: "Oboe", store_price: 600,
  score: 5, store_reviews: "本体に割れがあったため、緊急で直してもらいました。よかったです。")
Review.create!(store_id: 5, user_id: 1, reviews_title: "その他", instrument_name: "Fagot", store_price: 600,
  score: 4, store_reviews: "ボーカル購入。ついでにメトロノームとチューナが一体化したKORGのTM-60-BKを購入")
Review.create!(store_id: 3, user_id: 1, reviews_title: "楽器売却", instrument_name: "Tuba", store_price: 600000,
  score: 4, store_reviews: "Tuba88にて楽器売却。委託販売になるので、売れたらお金が入ってくる。チューバ専門店であり、主に中古チューバ、中古マウスピースの品揃えが良い。ホームページをチェックしていると掘り出し物がある時があり、そういうものはすぐ売れてしまう。")
