require 'rails_helper'

RSpec.describe "User", type: :system do
  let!(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規登録が成功' do
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
          it 'ユーザの新規登録が失敗' do
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
          it 'ユーザーの新規登録が失敗する' do
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
    describe 'ログイン後' do
      before do
        sign_in user
      end
        describe 'ユーザー編集' do
          context 'フォームの入力値が正常' do
            it 'ユーザーの編集が成功' do
              visit edit_user_registration_path
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
            it 'ユーザーの編集が失敗' do
              visit edit_user_registration_path
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
