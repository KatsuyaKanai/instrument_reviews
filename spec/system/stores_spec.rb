require 'rails_helper'

RSpec.describe "Stores", type: :system do
  let!(:user) { create(:user, id: 1) }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  let!(:store) { create(:store, user_id: 1, created_at: 1.hour.ago) }
  let!(:store2) { create(:store, user_id: 2, name: "teststore_2") }
  let!(:review) { create(:review, user_id: 1, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test", created_at: 1.hour.ago) }
  let!(:review2) { create(:review, user_id: 2, store_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test2") }
  let!(:review3) { create(:review, user_id: 2, store_id: 2, reviews_title: "消耗品購入", score: 4, store_price: 7777, instrument_name: "Tuba", store_reviews: "test3", created_at: 1.hour.ago) }

  scenario 'ホームにアクセスする' do
    visit stores_path
    within("#title") do
      click_link 'Wind Musical Instrument Review Please'
    end
    expect(current_path).to eq root_path
  end

  context "stores#show" do
    scenario "ログインしていなければログイン画面に遷移すること" do
      visit store_path(store)
      expect(current_path).to eq user_session_path
    end
  end

  describe 'ログイン後' do
    before do
      sign_in(user)
    end

    describe "Store#show" do
      before do
        visit stores_path
      end

      scenario "楽器店のレビュー投稿画面に移動する" do
        click_link "レビューを書く", match: :first
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
      end
      # review_spec?
      scenario "楽器店のレビュー一覧に戻る" do
        click_link "レビューを書く", match: :first
        expect(current_path).to eq store_path(store)
        click_on "他のレビューを見る"
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(current_path).to eq store_reviews_path(store)
      end
    end
  end

  describe "Stores#search" do
    context "楽器店の検索" do
      scenario "店名で一致するデータが表示される" do
        visit root_path
        fill_in 'q[name_or_address_cont]', with: 'test'
        click_on '検索'
        expect(page).to have_content "#{@store}件見つかりました"
        expect(page).to have_content "test"
      end

      scenario "都道府県で一致するデータが表示される" do
        visit root_path
        fill_in 'q[name_or_address_cont]', with: '東京都'
        click_on '検索'
        expect(page).to have_content "#{@store}件見つかりました"
        expect(page).to have_content "東京都"
      end

      scenario "店名または都道府県で一致しないデータが表示されない" do
        visit root_path
        fill_in 'q[name_or_address_cont]', with: '埼玉県'
        click_on '検索'
        expect(page).to have_content "0件見つかりました"
      end
    end

    context "stores_pathから楽器店の検索" do
      scenario "店名で一致するデータが表示される" do
        visit stores_path
        fill_in 'q[name_or_address_cont]', with: 'test'
        click_on '検索'
        expect(page).to have_content "#{@store}件見つかりました"
        expect(page).to have_content "test"
      end

      scenario "都道府県で一致するデータが表示される" do
        visit stores_path
        fill_in 'q[name_or_address_cont]', with: '東京都'
        click_on '検索'
        expect(page).to have_content "#{@store}件見つかりました"
        expect(page).to have_content "東京都"
      end

      scenario "店名または都道府県で一致しないデータが表示されない" do
        visit stores_path
        fill_in 'q[name_or_address_cont]', with: '埼玉県'
        click_on '検索'
        expect(page).to have_content "0件見つかりました"
      end
    end

    context "楽器店のソート機能" do
      before do
        visit stores_path
      end
      # ソート前の表示の並びもテストしたい

      scenario "店の登録の新着順でソートできる" do
        select "店の登録の新着順", from: 'stores_sort'
        within '.stores' do
          store_names = all('.store-name').map(&:text)
          expect(store_names).to eq %w(teststore_2 teststore)
        end
      end

      scenario "レビューの新着順でソートできる" do
        select "レビューの新着順", from: 'stores_sort'
        within '.stores' do
          store_names = all('.store-name').map(&:text)
          expect(store_names).to eq %w(teststore_2 teststore)
        end
      end

      scenario "評価が高い順でソートできる" do
        select "評価が高い順", from: 'stores_sort'
        within '.stores' do
          store_names = all('.store-name').map(&:text)
          expect(store_names).to eq %w(teststore_2 teststore)
        end
      end

      scenario "レビューが多い順でソートできる" do
        select "レビューが多い順", from: 'stores_sort'
        within '.stores' do
          store_names = all('.store-name').map(&:text)
          expect(store_names).to eq %w(teststore_2 teststore)
        end
      end
    end
  end
end
