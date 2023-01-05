require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  let(:user3) { create(:user, id: 3, email: "testuser3@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:store2) { create(:store, id: 2, name: "test_store2") }
  let!(:review) { create(:review, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test") }
  let(:review3) { create(:review, store_id: 2, reviews_title: "消耗品購入", score: 5, store_price: 8888, instrument_name: "Trumpet", store_reviews: "test3") }

  before do
    sign_in(user)
  end

  describe "reviews#index" do
    before do
      get store_reviews_path(store)
    end

    it "レビュー一覧のページにアクセスできること" do
      expect(response).to have_http_status(200)
    end

    it "レビューの一覧が表示されること" do
      expect(response.body).to include review.reviews_title
      expect(response.body).to include review.score.to_s
      expect(response.body).to include review.instrument_name
      expect(response.body).to include review.user.name
      expect(response.body).to include review2.reviews_title
      expect(response.body).to include review2.score.to_s
      expect(response.body).to include review2.instrument_name
      expect(response.body).to include review2.user.name
    end

    it "レビューされている楽器店の情報が表示されること" do
      expect(response.body).to include store.name
      expect(response.body).to include store.address
      expect(response.body).to include store.nearest_station
      expect(response.body).to include store.reviews.count.to_s
      expect(response.body).to include store.avg_score.to_s
      expect(response.body).to include(store.image.attachment.to_s)
    end


    it "違う店のレビューが表示されないこと" do
      expect(response.body).not_to include store2.name
    end
  end

  # ↓store#newと同じになってる
  describe "reviews#new" do
    before do
      get store_path(store)
    end

    it "レビューの新規登録画面にアクセスできること" do
      expect(response).to have_http_status(200)
    end

    it "レビューの新規登録画面の店情報が正しいこと" do
      expect(response.body).to include store.name
      expect(response.body).not_to include store2.name
    end
  end

  describe "reviews#edit" do
    before do
      get edit_store_review_path(store, review)
    end

    it "レビューの編集ページにアクセスできること" do
      expect(response).to have_http_status(200)
    end

    it "レビューの編集ページの情報が正しいこと" do
      expect(response.body).to include store.name
      expect(response.body).not_to include store2.name
      expect(response.body).to include review.reviews_title
      expect(response.body).to include review.score.to_s
      expect(response.body).to include review.instrument_name
      expect(response.body).to include review.user.name
    end
  end

  describe "reviews#destroy" do
    before do
      delete store_review_path(store, review)
    end
    # 全レビューが削除されている、system_specに書かれている

    it 'レビューが削除される' do
      expect(response.body).not_to include review.reviews_title
      expect(response.body).not_to include review.score.to_s
      expect(response.body).not_to include review.instrument_name
      expect(response.body).not_to include review.user.name
    end
  end
end
