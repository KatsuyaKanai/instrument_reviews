require 'rails_helper'

RSpec.describe "Stores", type: :request do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  let(:user3) { create(:user, id: 3, email: "testuser3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:store2) { create(:store, id: 2, name: "test_store2", address: "埼玉県所沢市くすのき台") }
  let!(:review) { create(:review, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }

  describe "stores#index" do
    before do
      get stores_path
    end

    it "リクエストが200が返ってくること" do
      expect(response).to have_http_status(200)
    end

    it "店名がレスポンスに含まれること" do
      expect(response.body).to include store.name
      expect(response.body).to include store2.name
    end

    # ↓できているかわかりません
    it "住所がレスポンスに含まれること" do
      expect(response.body).to match(/.*[区市]/)
      expect(response.body).to match(/.*[区市]/)
    end

    it "最寄駅がレスポンスに含まれること" do
      expect(response.body).to include store.nearest_station
      expect(response.body).to include store2.nearest_station
    end

    it "レビューの件数が表示されること" do
      expect(response.body).to include store.reviews.count.to_s
      expect(response.body).to include store2.reviews.count.to_s
    end

    it "レビューの平均点が表示されること" do
      expect(response.body).to include store.avg_score.to_s
      expect(response.body).to include store2.avg_score.to_s
    end
  end

  # ↓system_spec?
  describe "storeのavg_score" do
    let!(:review3) { create(:review, store_id: 1, reviews_title: "消耗品購入", score: 1, store_price: 7777, instrument_name: "Flute", store_reviews: "test3") }

    before do
      get stores_path
    end

    it "レビューの平均点がレビューのスコアで変わること" do
      expect(store.avg_score.to_s).to eq "3.3"
    end
  end

  describe "stores#show" do
    before do
      sign_in(user)
      get store_path(store)
    end

    it "リクエストが200がかえってくること" do
      expect(response).to have_http_status(200)
    end

    it "storeの情報が表示されること" do
      expect(response.body).to include store.name
      expect(response.body).to include store.address
      expect(response.body).to include store.nearest_station
      expect(response.body).to include store.reviews.count.to_s
      expect(response.body).to include store.avg_score.to_s
    end
  end
end
