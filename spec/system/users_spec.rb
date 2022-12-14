require 'rails_helper'

RSpec.describe "User", type: :system do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user, id: 2, name: "testman2", email: "testman2@example.com") }
  let(:user3) { create(:user, id: 3, email: "testman3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:store2) { create(:store, name: "teststore_2") }
  let!(:store3) { create(:store, name: "teststore_3") }
  let!(:review) { create(:review, user_id: 1, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }
  let!(:review3) { create(:review, user_id: 1, store_id: 2, reviews_title: "その他", score: 3, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          scenario 'ユーザーの新規登録が成功' do
            visit new_user_registration_path
            fill_in '名前', with: 'test'
            fill_in 'Eメール', with: 'test@example.com'
            fill_in 'パスワード', with: 'password'
            fill_in 'パスワード（確認用）', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq root_path
            expect(page).to have_content 'アカウント登録が完了しました'
          end
        end

        context 'メールアドレス未記入' do
          scenario 'ユーザの新規登録が失敗' do
            visit new_user_registration_path
            fill_in '名前', with: 'test'
            fill_in 'Eメール', with: nil
            fill_in 'パスワード', with: 'password'
            fill_in 'パスワード（確認用）', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq users_path
            expect(page).to have_content "Eメールを入力してください"
          end
        end

        context '登録済みメールアドレス' do
          scenario 'ユーザーの新規登録が失敗する' do
            visit new_user_registration_path
            fill_in '名前', with: 'test'
            fill_in 'Eメール', with: user.email
            fill_in 'パスワード', with: 'password'
            fill_in 'パスワード（確認用）', with: 'password'
            click_button 'Sign up'
            expect(current_path).to eq users_path
            expect(page).to have_content "Eメールはすでに存在します"
          end
        end
      end
    end

    describe "User#show" do
      before do
        visit root_path
        click_link user.name, match: :first
      end

      context "card内のユーザー名をクリックした時" do
        scenario "そのユーザーのレビュー一覧が見れる" do
          expect(current_path).to eq user_path(user)
          expect(page).to have_content review.reviews_title
          expect(page).to have_content review3.reviews_title
          expect(page).not_to have_content review2.reviews_title
        end
      end
    end

    describe 'ログイン後' do
      before do
        sign_in(user)
      end

      describe "User#index" do
        context "headerのユーザー名をクリックすると" do
          scenario "ユーザのアドレス、投稿情報が表示される" do
            visit root_path
            click_link('user_name')
            expect(current_path).to eq users_path
            expect(page).to have_content "アカウント情報"
            expect(page).to have_content user.email
            expect(page).to have_content "#{user.name}さんの投稿一覧"
            expect(page).to have_content review.reviews_title
            expect(page).to have_content review3.reviews_title
            expect(page).not_to have_content review2.reviews_title
          end
        end

        describe 'User#edit' do
          before do
            visit root_path
            click_link('user_name')
          end

          context 'フォームの入力値が正常' do
            scenario 'ユーザーの編集が成功' do
              click_link "ユーザーデータの編集をする"
              fill_in '名前', with: user.name
              fill_in 'Eメール', with: 'test@example.com'
              fill_in 'パスワード', with: 'testtest'
              fill_in 'パスワード（確認用）', with: 'testtest'
              fill_in '現在のパスワード', with: user.password
              click_button 'Update'
              expect(current_path).to eq root_path
              expect(page).to have_content 'アカウント情報を変更しました'
            end
          end

          context 'メールアドレス未記入' do
            scenario 'ユーザーの編集が失敗' do
              click_link "ユーザーデータの編集をする"
              fill_in '名前', with: user.name
              fill_in 'Eメール', with: nil
              fill_in 'パスワード', with: 'password'
              fill_in 'パスワード（確認用）', with: 'password'
              fill_in '現在のパスワード', with: user.password
              click_button 'Update'
              expect(current_path).to eq users_path
              expect(page).to have_content "Eメールを入力してください"
            end
          end
        end
      end
    end
  end
end
