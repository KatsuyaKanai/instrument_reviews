require 'rails_helper'

RSpec.describe "Stores", type: :system do
  let(:store) { create(:store) }
  let(:store2) { create(:store) }
  let(:review) { create(:review, stores: [store]) }
  let(:review2) { create(:review2, stores: [store]) }

  before do
    @user = FactoryBot.create(:user)
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
      sign_in @user
    end
      describe '楽器店の新規登録' do
        context 'フォームの入力値が正常' do
          it '楽器店の新規登録が成功する' do
            visit stores_path

            click_link "口コミを投稿したい店がない場合"
            fill_in "name", with: "test"
            fill_in "address", with: "東京都"
            fill_in "nearest_station", with: "test_station"
            click_button "登録"
            expect(page).to have_content "test"
            expect(page).to have_content "東京都"
            expect(page).to have_content "test_station"
            expect(current_path).to eq '/stores/:store_id'       
          end
        end

      # context 'タイトルが未入力' do
      #   it 'タスクの新規登録が失敗する' do
      #     visit root_path
      #     click_link "New task"
      #     fill_in "task_title", with: ""
      #     fill_in "task_content", with: "test_content"
      #     find("#task_status").find("option[value='todo']").select_option
      #     fill_in "task_deadline", with: DateTime.new(2021, 8, 1, 10, 30)
      #     click_button "Create Task"
      #     expect(page).to have_content "1 error prohibited this task from being saved:"
      #     expect(page).to have_content "Title can't be blank"
      #     expect(current_path).to eq tasks_path
      #   end
      # end

      # context '登録済みのタイトルを入力' do
      #   it 'タスクの新規登録が失敗する' do
      #     task = create(:task)
      #     visit root_path
      #     click_link "New task"
      #     fill_in "task_title", with: task.title
      #     fill_in "task_content", with: "test_content"
      #     find("#task_status").find("option[value='todo']").select_option
      #     fill_in "task_deadline", with: DateTime.new(2021, 8, 1, 10, 30)
      #     click_button "Create Task"
      #     expect(page).to have_content "1 error prohibited this task from being saved:"
      #     expect(page).to have_content "Title has already been taken"
      #     expect(current_path).to eq tasks_path
      #   end
       end
    
  end

  # scenario 'ホームにアクセスする' do
  #   click_link 'Wind Musical Instrument Review Please'
  #   expect(current_path).to eq potepan_path
  # end
end
