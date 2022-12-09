require 'rails_helper'

RSpec.describe "Homes", type: :system do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, name: "testman2", email: "testuser2@example.com") }
  let!(:user3) { create(:user, id: 3, name: "testman3", email: "testuser3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:store2) { create(:store, id: 2, user_id: 2, name: "test_store2") }
  let!(:store3) { create(:store, id: 3, user_id: 2, name: "test_store3") }
  let!(:store4) { create(:store, id: 4, user_id: 2, name: "test_store4") }
  let!(:review) { create(:review, user_id: 1, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }
  let!(:review3) { create(:review, user_id: 2, store_id: 2, reviews_title: "消耗品購入", score: 5, store_price: 8888, instrument_name: "Trumpet", store_reviews: "test3") }
  let!(:review4) { create(:review, user_id: 2, store_id: 4, reviews_title: "楽器売却", score: 2, store_price: 9999, instrument_name: "Tuba", store_reviews: "test", created_at: 1.hour.ago) }

  before do
    visit root_path
  end

  describe "Homes#index" do
    scenario "最新の口コミTop3が表示される" do
      expect(page).to have_content review.reviews_title
      expect(page).to have_content review2.reviews_title
      expect(page).to have_content review3.reviews_title
      expect(page).not_to have_content review4.reviews_title
    end

    scenario "評価が高い店Top3が表示される" do
      expect(page).to have_content store.name
      expect(page).to have_content store2.name
      expect(page).not_to have_content store3.name
      expect(page).to have_content store4.name
    end

    scenario "楽器店一覧をクリックすると楽器店一覧のページに移動する" do
      click_link '楽器店一覧'
      expect(current_path).to eq stores_path
    end

    scenario "ユーザー名をクリックするとユーザーのページに移動する" do
      click_on user.name
      expect(current_path).to eq user_path(user)
    end

    scenario "ゲストユーザーとしてログインする" do
      click_on "ゲストログイン", match: :first
      expect(page).to have_content "ゲストユーザーとしてログインしました"
    end

    scenario "利用規約にアクセスできる" do
      click_link "利用規約"
      within('#rule') do
        expect(page).to have_content "利用規約"
      end
    end

    scenario "利用規約からプライバシーポリシーにアクセスできる" do
      click_link "利用規約"
      click_link "プライバシーポリシー", match: :first
      within('#privacy_policy') do
        expect(page).to have_content "プライバシーポリシー"
      end
    end

    scenario "プライバシーポリシーにアクセスできる" do
      click_link "プライバシーポリシー"
      within('#privacy_policy') do
        expect(page).to have_content "プライバシーポリシー"
      end
    end
  end

  describe "topページのレビューの編集、削除" do
    before do
      sign_in(user)
      visit root_path
    end

    scenario "自分が投稿したレビューを編集できる(編集ページに移動)" do
      click_link "編集"
      expect(current_path).to eq edit_store_review_path(store, review)
    end
    scenario "自分が投稿したレビューを削除できる" do
      click_link "削除"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content "レビューが削除されました"
      expect(current_path).to eq root_path
      expect(page).not_to have_content '#{review.reviews_title}'
    end

    context "current_user.id == user.idではないとき" do
      before do
        sign_in(user3)
        visit root_path
      end

      scenario "他者のレビューを編集、削除できない(リンクがない)" do
        expect(page).not_to have_content "編集"
        expect(page).not_to have_content "削除"
      end
    end
  end
end
