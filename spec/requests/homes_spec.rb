require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  # let(:user3) { create(:user, id:3, email: "testuser3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:store2) { create(:store, id: 2, user_id: 2, name: "test_store2") }
  let!(:store3) { create(:store, id: 3, user_id: 2, name: "test_store3") }
  let!(:store4) { create(:store, id: 4, name: "test_store4")}
  let!(:review) { create(:review, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }
  let!(:review3) { create(:review, user_id: 2, store_id: 2, reviews_title: "消耗品購入", score: 5, store_price: 8888, instrument_name: "Trumpet", store_reviews: "test3") }
  let!(:review4) { create(:review, user_id: 2, store_id: 3, reviews_title: "楽器売却", score: 2, store_price: 7777, instrument_name: "Trumpet", store_reviews: "test4", created_at: 1.hour.ago) }

  before do
    get root_path
  end

  describe "Homes#index" do
    it "最新の口コミTop3が表示される" do
      expect(response.body).to include review.reviews_title
      expect(response.body).to include review2.reviews_title
      expect(response.body).to include review3.reviews_title
      expect(response.body).not_to include review4.reviews_title
    end

    it "評価が高い店Top3が表示される" do
      expect(response.body).to include store.name
      expect(response.body).to include store2.name
      expect(response.body).to include store3.name
      expect(response.body).not_to include store4.name
    end
  end
end
