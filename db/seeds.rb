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
Store.create!(user_id: 1, name: "nero楽器", address: "東京都", nearest_station: "渋谷駅")
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
  score: 4, store_reviews: "下倉楽器主催の中学生の楽器別講習会に顧問として引率しました。楽器の状態が悪ければ講師の先生が教えてくださり、簡単な修理は会場に来ている
  下倉楽器のリペアスタッフが直してくれました。")
Review.create!(store_id: 1, user_id: 1, reviews_title: "楽器修理、調整", instrument_name: "Oboe", store_price: 600,
  score: 5, store_reviews: "本体に割れがあったため、緊急で直してもらいました。よかったです。")
Review.create!(store_id: 5, user_id: 1, reviews_title: "その他", instrument_name: "Fagot", store_price: 600,
  score: 4, store_reviews: "ボーカル購入。ついでにメトロノームとチューナが一体化したKORGのTM-60-BKを購入")
Review.create!(store_id: 3, user_id: 1, reviews_title: "悪鬼売却", instrument_name: "Tuba", store_price: 600000,
  score: 4, store_reviews: "Tuba88にて楽器売却。委託販売になるので、売れたらお金が入ってくる。チューバ専門店であり、主に中古チューバ、中古マウスピースの品揃えが良い。
  ホームページをチェックしていると掘り出し物がある時があり、そういうものはすぐ売れてしまう。")
  

  
  
    
