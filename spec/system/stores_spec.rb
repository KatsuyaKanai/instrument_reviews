require 'rails_helper'

RSpec.describe "Stores", type: :system do
  let(:user) { create(:user, id: "1") }
  let(:user2) { create(:user, id: "2", email: "testuser2@example.com") }
  let!(:store) { create(:store, user_id: "1") }
  let(:store2) { create(:store) }
  let(:review) { create(:review, user_id: "1", store: [store]) }
  let(:review2) { create(:review2, user_id: "2", store: [store]) }

  scenario 'ホームにアクセスする' do
    visit stores_path
    within("#title") do
      click_link 'Wind Musical Instrument Review Please'
    end
    expect(current_path).to eq root_path
  end

  context "stores#new" do
    scenario "ログインしていなければログイン画面に遷移すること" do
      visit new_store_path
      expect(current_path).to eq user_session_path
    end
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
    describe 'Stores#new' do
      context 'フォームの入力値が正常' do
        scenario '楽器店の新規登録が成功する' do
          visit stores_path
          click_link "口コミを投稿したい店がない場合"
          fill_in "name", with: "test"
          select "東京都", from: "address"
          fill_in "nearest_station", with: "test_station"
          click_button "登録"
          expect(page).to have_content "test"
          expect(page).to have_content "東京都"
          expect(page).to have_content "test_station"
          expect(page).to have_content "レビューを書く"      
        end
      end

      context '店名が未入力' do
        scenario '楽器店の新規登録が失敗する' do
          visit stores_path(store)
          click_link "口コミを投稿したい店がない場合"
          fill_in "name", with: ""
          select "東京都", from: "address"
          fill_in "nearest_station", with: "test_station"
          click_button "登録"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "店名を入力してください"
          expect(current_path).to eq stores_new_path
        end
      end

      context '店名が登録済み' do
        scenario '楽器店の新規登録が失敗する' do
          visit stores_path
          click_link "口コミを投稿したい店がない場合"
          fill_in "name", with: store.name
          select "東京都", from: "address"
          fill_in "nearest_station", with: "test_station"
          click_button "登録"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "店名はすでに存在します"
          expect(current_path).to eq stores_new_path
        end
      end

      context '都道府県名が未入力' do
        scenario '楽器店の新規登録が失敗する' do
          visit stores_path
          click_link "口コミを投稿したい店がない場合"
          fill_in "name", with: "test"
          select "---", from: "address"
          fill_in "nearest_station", with: "test_station"
          click_button "登録"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "都道府県を入力してください"
          expect(current_path).to eq stores_new_path
        end
      end

      context '最寄駅が未入力' do
        scenario '楽器店の新規登録が失敗する' do
          visit stores_path
          click_link "口コミを投稿したい店がない場合"
          fill_in "name", with: "test"
          select "東京", from: "address"
          fill_in "nearest_station", with: ""
          click_button "登録"
          expect(page).to have_content "1件のエラーがあります。"
          expect(page).to have_content "最寄駅を入力してください"
          expect(current_path).to eq stores_new_path
        end
      end
    end
    describe "Stores#edit" do
      describe "楽器店の登録者の場合" do
        before do
          visit stores_path
        end
        context "楽器店の編集が成功する" do
          scenario "フォームの入力が正常" do
            click_link "店の情報の編集"
            fill_in "店名", with: "edit_test"
            select "埼玉", from: "都道府県"
            fill_in "最寄駅", with: "edit_station"
            click_button "更新する"
            expect(page).to have_content "edit_test"
            expect(page).to have_content "埼玉"
            expect(page).to have_content "edit_station"
            expect(page).to have_content "店情報を編集しました"
          end
        end
        context "楽器店の編集が失敗する" do
          scenario "楽器店名が空欄" do
            click_link "店の情報の編集"
            fill_in "店名", with: ""
            select "埼玉", from: "都道府県"
            fill_in "最寄駅", with: "edit_station"
            click_button "更新する"
            expect(page).to have_content "1件のエラーがあります。"
            expect(page).to have_content "店名を入力してください"
            expect(page).to have_content "編集に失敗しました"
          end
          scenario "都道府県が未選択" do
            click_link "店の情報の編集"
            fill_in "店名", with: "edit_test"
            select "---", from: "都道府県"
            fill_in "最寄駅", with: "edit_station"
            click_button "更新する"
            expect(page).to have_content "1件のエラーがあります。"
            expect(page).to have_content "都道府県を入力してください"
            expect(page).to have_content "編集に失敗しました"
          end
          scenario "最寄駅が未入力" do
            click_link "店の情報の編集"
            fill_in "店名", with: "edit_test"
            select "埼玉", from: "都道府県"
            fill_in "最寄駅", with: ""
            click_button "更新する"
            expect(page).to have_content "1件のエラーがあります。"
            expect(page).to have_content "最寄駅を入力してください"
            expect(page).to have_content "編集に失敗しました"
          end
        end
        context "Stores#destroy" do
          scenario "楽器店を削除する" do
            click_on :delete_button
            page.driver.browser.switch_to.alert.accept
            expect(page).to have_content "店情報が削除されました"
            expect(page).not_to have_content store.name
          end
          scenario "楽器店の削除をキャンセルする" do
            click_on :delete_button
            page.driver.browser.switch_to.alert.dismiss
            expect(page).to have_content store.name
          end
        end
      end
      context "楽器店の登録者でない場合" do
        before do
          sign_in(user2)
        end
        scenario "楽器店の編集、削除のリンクがない" do
          expect(page).not_to have_content "店情報の編集"
          expect(page).not_to have_content "楽器店を削除する"
        end
      end
    end
    describe "Store#show" do
      before do
        visit stores_path
      end
      scenario "楽器店のレビュー投稿画面に移動する" do
        click_link "レビューを書く"
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(page).to have_content "レビューを書く"
      end
      #review_spec?
      scenario "楽器店のレビュー一覧に戻る" do
        click_link "レビューを書く"
        expect(current_path).to eq store_path(store)
        click_on "他のレビューを見る"
        expect(page).to have_content store.name
        expect(page).to have_content store.address
        expect(page).to have_content store.nearest_station
        expect(current_path).to eq store_reviews_path(store)
      end
    end  
  end

end
