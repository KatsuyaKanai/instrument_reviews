# 楽器店口コミ投稿サイト(Wind_Instrument_Reviews_Please)

* Ruby version
* 2.7.6

* アプリ名
Wind_Instrument_Reviews_Please

* なぜ作ったのか
ポートフォリオとして、楽器店の情報を共有できるサイトを作ろうと思い作りました。私自身、職業音楽家として色々な楽器店にお世話になり(接客態度の悪いお店はなかったと思いますが)、楽器店の場所、最寄駅、楽器毎の口コミ、かかった料金があればいいなと思い作成しました。

* demo画像
topページ上部
<img width="1057" alt="portfolio スクショ１" src="https://user-images.githubusercontent.com/98877481/207737144-8f0727e8-4b40-41ad-8c34-1fbcd4265b5f.png">
topページ下部
<img width="1164" alt="portfolio スクショ2" src="https://user-images.githubusercontent.com/98877481/207737610-e3ac08e3-a572-4518-88b0-8bd67e5a0b22.png">
stores_index_path
<img width="1165" alt="portfolio 店情報一覧" src="https://user-images.githubusercontent.com/98877481/207737827-253b3d35-d770-45ef-aad3-aea2639242d1.png">
stores_reviews_index_path(store,review)
<img width="1165" alt="portfolio review_index" src="https://user-images.githubusercontent.com/98877481/207738091-57957be4-2a6a-46af-ad0a-4e814477eff8.png">

* 使い方
・ログインしてください。(ゲストログインでも構いません)
・レビューしたい楽器店を「楽器店一覧」のリンクかtopページの「検索」で選んでください。もしレビューしたい楽器店がない場合、楽器店の新規登録をしてください。
・「レビューを書く」をクリックしてレビューを書いてください。

* ER図
<img width="637" alt="portfolio_er図" src="https://user-images.githubusercontent.com/98877481/207738774-2b0a0f29-d2c4-48f6-a47e-783af3809502.png">

* 機能一覧
・ログイン機能
・userの情報の編集、削除機能
・storeの新規登録、編集、削除機能
・reviewの新規登録、編集、削除機能
・星評価機能
・gem 'ransack'による検索、ソート機能

* こだわりポイントなど
・全体的なレイアウトはマンションノート様
https://www.mansion-note.com/
を参考に作りました。
・星評価は
https://www.youtube.com/watch?v=NOOYABsAip0
を参考にしました。
・awsは
https://pikawaka.com/rails/ec2_deploy#%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E3%81%99%E3%82%8B%E3%82%A2%E3%83%97%E3%83%AA%E3%82%92%E3%82%AF%E3%83%AD%E3%83%BC%E3%83%B3%E3%81%97%E3%82%88%E3%81%86
を参考にしました。自動デプロイについても
https://pikawaka.com/rails/capistrano
を参考にしました。
・最初はgooglemapで楽器店名と住所を表示しようと考えていましたが、ユーザーが楽器店名を正確に入力しなければならないのと住所を正確に入力しなければいけないため、導入しませんでした。今は所在する都道府県と最寄駅のカラムになっていますが、最寄駅は必要かどうか分かりません。私は車を持っていないため最寄駅があった方が助かるのですが。
