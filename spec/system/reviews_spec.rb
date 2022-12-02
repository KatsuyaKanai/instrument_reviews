require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let(:user) { create(:user, id: "1") }
  let(:user2) { create(:user, id: "2", email: "testuser2@example.com") }
  let!(:store) { create(:store, user_id: "1") }
  let(:store2) { create(:store, name: "test_store2") }
  let(:review) { create(:review, user_id: "1", store: [store]) }
  let(:review2) { create(:review2, user_id: "2", store: [store]) }

  describe "reviews#index" do
    before do
      visit stores_path
    end
    scenario "楽器店のレビューをみる" do
      click_link "レビューを見る"
      expect(current_path).to eq store_reviews_path(store)
      expect(page).to have_content store.name
      expect(page).to have_content store.address
      expect(page).to have_content store.nearest_station
      expect(page).to have_content "レビュー一覧"
      expect(page).to have_content review.title
      expect(page).to have_content review.score
      expect(page).to have_content review.price
      expect(page).to have_content review.store_reviews
      expect(page).to have_content review.user.name
      expect(page).to have_content review.instrument_name
    end
    scenario "レビューの編集" do
    end
    scenario "レビューの削除" do
    end
  end
    
end
