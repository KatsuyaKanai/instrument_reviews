require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { create(:user, id: 1, name: "testman") }
  let!(:user2) { create(:user, id: 2, email: "testuser2@example.com") }
  let!(:store) { create(:store, user_id: 1) }
  let!(:review) { create(:review, reviews_title: "その他", score: 4, store_price: 9999, instrument_name: "Horn", store_reviews: "test") }
  let!(:review2) { create(:review, user_id: 2, reviews_title: "楽器修理", score: 5, store_price: 8888, instrument_name: "Fagot", store_reviews: "test2") }
  let!(:review3) { create(:review, user_id: 2, reviews_title: "消耗品購入", score: 1, store_price: 7777, instrument_name: "Tuba", store_reviews: "test3") }

  before do
    sign_in(user)
    get users_path(user)
  end

  describe "User#show" do
    it "ログインしているユーザーのアカウント情報、投稿が表示されること" do
      expect(response.body).to include review.reviews_title
      expect(response.body).not_to include review2.reviews_title
      expect(response.body).to include user.email
      expect(response.body).not_to include user2.email
    end

    it "ログインしていないユーザーのアカウント情報、投稿が表示されないこと" do
      expect(response.body).not_to include review2.reviews_title
      expect(response.body).not_to include user2.email
    end
  end

  describe "User#index" do
    before do
      sign_in(user2)
      get user_path(user2)
    end

    it "ユーザーのレビューの投稿一覧が表示されること" do
      expect(response.body).not_to include review.reviews_title
      expect(response.body).to include review2.reviews_title
      expect(response.body).to include review3.reviews_title
    end
  end
end
