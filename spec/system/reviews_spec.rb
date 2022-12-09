require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  let(:user3) { create(:user, id: 3, email: "testuser3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let(:store2) { create(:store, id: 2, name: "test_store2") }
  let!(:review) { create(:review, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }

  describe "reviews#index" do
    before do
      sign_in(user)
      visit stores_path
    end

    scenario "楽器店のレビューをみる" do
      click_link "レビューを見る"
      expect(current_path).to eq store_reviews_path(store)
      expect(page).to have_content store.name
      expect(page).to have_content store.address
      expect(page).to have_content store.nearest_station
      expect(page).to have_content "レビュー一覧"
      expect(page).to have_content review.reviews_title
      expect(page).to have_content review.score
      expect(page).to have_content review.store_price
      expect(page).to have_content review.store_reviews
      expect(page).to have_content review.user.name
      expect(page).to have_content review.instrument_name
    end

    context "レビューの編集画面に移動" do
      scenario "レビュー編集画面からレビュー一覧に戻る" do
        click_link "レビューを見る"
        expect(current_path).to eq store_reviews_path(store)
        click_on "編集"
        expect(current_path).to eq edit_store_review_path(store, review)
        click_link "レビュー一覧に戻る"
        expect(current_path).to eq store_reviews_path(store)
      end
    end

    context "reviews#edit" do
      scenario "レビューの編集ができる" do
        click_link "レビューを見る"
        expect(current_path).to eq store_reviews_path(store)
        click_on "編集"
        expect(current_path).to eq edit_store_review_path(store, review)
        select review.reviews_title, from: "タイトル"
        select review.instrument_name, from: "楽器名"
        fill_in "料金", with: review.store_price
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: review.store_reviews
        click_button "編集する"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューを編集しました"
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビュー一覧"
        expect(page).to have_content review.reviews_title
        expect(page).to have_content review.score
        expect(page).to have_content review.store_price
        expect(page).to have_content review.store_reviews
        expect(page).to have_content review.user.name
        expect(page).to have_content review.instrument_name
      end

      scenario "他者のレビューを編集、削除できない" do
        sign_in(user3)
        click_link "レビューを見る"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).not_to have_content "編集"
        expect(page).not_to have_content "削除"
      end

      context "レビューの編集の失敗" do
        scenario "タイトルが未選択の時" do
          click_link "レビューを見る"
          expect(current_path).to eq store_reviews_path(store)
          click_on "編集"
          expect(current_path).to eq edit_store_review_path(store, review)
          select "---", from: "タイトル"
          select review.instrument_name, from: "楽器名"
          fill_in "料金", with: review.store_price
          expect(find('#star4').hover.click)
          fill_in "review[store_reviews]", with: review.store_reviews
          click_button "編集する"
          expect(current_path).to eq store_review_path(store, review)
          expect(page).to have_content "編集に失敗しました"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "タイトルを入力してください"
        end

        scenario "楽器名が未選択の時" do
          click_link "レビューを見る"
          expect(current_path).to eq store_reviews_path(store)
          click_on "編集"
          expect(current_path).to eq edit_store_review_path(store, review)
          select review.reviews_title, from: "タイトル"
          select "---", from: "楽器名"
          fill_in "料金", with: review.store_price
          expect(find('#star4').hover.click)
          fill_in "review[store_reviews]", with: review.store_reviews
          click_button "編集する"
          expect(current_path).to eq store_review_path(store, review)
          expect(page).to have_content "編集に失敗しました"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "楽器名を入力してください"
        end

        scenario "料金が未入力の時" do
          click_link "レビューを見る"
          expect(current_path).to eq store_reviews_path(store)
          click_on "編集"
          expect(current_path).to eq edit_store_review_path(store, review)
          select review.reviews_title, from: "タイトル"
          select review.instrument_name, from: "楽器名"
          fill_in "料金", with: ""
          expect(find('#star4').hover.click)
          fill_in "review[store_reviews]", with: review.store_reviews
          click_button "編集する"
          expect(current_path).to eq store_review_path(store, review)
          expect(page).to have_content "編集に失敗しました"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "料金を入力してください"
        end

        # 星評価はeditで値を持ってきて、未入力でも値が入っている？のでeditで星評価が未選択であることがない状態になっている？
        # scenario "星評価が未選択の時" do
        #   click_link "レビューを見る"
        #   expect(current_path).to eq store_reviews_path(store)
        #   click_on "編集"
        #   expect(current_path).to eq edit_store_review_path(store, review)
        #   select review.reviews_title, from: "タイトル"
        #   select review.instrument_name, from: "楽器名"
        #   fill_in "料金", with: @review.store_price
        #   expect(find('#star4').hover)
        #   fill_in "review[store_reviews]", with: review.store_reviews
        #   click_button "編集する"
        #   expect(current_path).to eq store_review_path(store, review)
        #   expect(page).to have_content "編集に失敗しました"
        #   expect(page).to have_content "1件のエラーがあります。"
        #   expect(page).to have_content "星評価を入力してください"
        # end

        scenario "レビューが未入力の時" do
          click_link "レビューを見る"
          expect(current_path).to eq store_reviews_path(store)
          click_on "編集"
          expect(current_path).to eq edit_store_review_path(store, review)
          select review.reviews_title, from: "タイトル"
          select review.instrument_name, from: "楽器名"
          fill_in "料金", with: review.store_price
          expect(find('#star4').hover.click)
          fill_in "review[store_reviews]", with: ""
          click_button "編集する"
          expect(current_path).to eq store_review_path(store, review)
          expect(page).to have_content "編集に失敗しました"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "レビューを入力してください"
        end
      end
    end

    context "reviews#destroy" do
      scenario "レビューの削除" do
        click_link "レビューを見る"
        expect(current_path).to eq store_reviews_path(store)
        click_link "削除"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "レビューが削除されました"
        expect(page).not_to have_content review.reviews_title
        expect(current_path).to eq store_reviews_path(store)
      end

      scenario "レビューの削除をキャンセル" do
        click_link "レビューを見る"
        expect(current_path).to eq store_reviews_path(store)
        click_link "削除"
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content review.reviews_title
        expect(current_path).to eq store_reviews_path(store)
      end
    end
  end

  describe "reviews#new" do
    before do
      sign_in(user)
      visit stores_path
    end

    context "レビューの投稿が成功" do
      scenario "入力欄に正しく入力しレビューの投稿が成功する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "その他", from: "タイトル"
        select "Horn", from: "楽器名"
        fill_in "料金", with: "9999"
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: "testreview"
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューが投稿されました"
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビュー一覧"
        expect(page).to have_content "その他"
        expect(page).to have_content "4.0"
        expect(page).to have_content "9999"
        expect(page).to have_content "testreview"
        expect(page).to have_content "testman"
        expect(page).to have_content "Horn"
      end
    end

    context "レビューの投稿が失敗" do
      scenario "タイトルが未選択だとレビューの投稿が失敗する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "---", from: "タイトル"
        select "Horn", from: "楽器名"
        fill_in "料金", with: "9999"
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: "testreview"
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューの投稿に失敗しました"
        expect(page).to have_content "タイトルを入力してください"
      end

      scenario "楽器名が未選択だとレビューの投稿が失敗する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "その他", from: "タイトル"
        select "---", from: "楽器名"
        fill_in "料金", with: "9999"
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: "testreview"
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューの投稿に失敗しました"
        expect(page).to have_content "楽器名を入力してください"
      end

      scenario "料金が空欄だとレビューの投稿が失敗する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "その他", from: "タイトル"
        select "Horn", from: "楽器名"
        fill_in "料金", with: ""
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: "testreview"
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューの投稿に失敗しました"
        expect(page).to have_content "料金を入力してください"
      end

      scenario "星評価が空欄だとレビューの投稿が失敗する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "その他", from: "タイトル"
        select "Horn", from: "楽器名"
        fill_in "料金", with: "9999"
        expect(find('#star4').hover)
        fill_in "review[store_reviews]", with: "testreview"
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューの投稿に失敗しました"
        expect(page).to have_content "星評価を入力してください"
      end

      scenario "レビューが空欄だとレビューの投稿が失敗する" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
        select "その他", from: "タイトル"
        select "Horn", from: "楽器名"
        fill_in "料金", with: "9999"
        expect(find('#star4').hover.click)
        fill_in "review[store_reviews]", with: ""
        click_button "保存"
        expect(current_path).to eq store_reviews_path(store)
        expect(page).to have_content "レビューの投稿に失敗しました"
        expect(page).to have_content "レビューを入力してください"
      end
    end
  end

  describe "Reviews#search" do
    before do
      visit root_path
    end

    context "レビューの検索" do
      # ↓なぜ@reviewが通るかよくわからない
      scenario "topから楽器名を選択して一致するデータが表示される" do
        select review.instrument_name, from: 'q[instrument_name_eq]'
        click_on '探す'
        expect(page).to have_content "#{@review}件見つかりました"
        expect(page).to have_content review.instrument_name
      end

      scenario "楽器名を「選択なし」にすると全レビューが表示される" do
        select "選択なし", from: 'q[instrument_name_eq]'
        click_on '探す'
        expect(page).to have_content "#{@review}件見つかりました"
        expect(page).to have_content review.instrument_name
      end

      scenario "楽器名で一致しないデータが表示されない" do
        select review2.instrument_name, from: 'q[instrument_name_eq]'
        click_on '探す'
        expect(page).to have_content "#{@review}件見つかりました"
        expect(page).to have_content review2.instrument_name
        expect(page).not_to have_content review.instrument_name
      end
    end
  end
end
