require 'rails_helper'

RSpec.describe "Stores", type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user)}
  let!(:store) { create(:store) }
  let(:store2) { create(:store) }
  let!(:many_stores) { create_list(:store, 5)}
  let(:review) { create(:review, stores: [store]) }
  let(:review2) { create(:review, stores: [store]) }
  let!(:many_reviews) { create_list(:review, 5, store: [store]) }

  before do
    @user = FactoryBot.create(:user)
  end

  describe "stores#index" do
    before do
      get stores_path
    end

    it "リクエストが200が返ってくること" do
      expect(response).to have_http_status(200)
    end

    it "店名がレスポンスに含まれること" do
      expect(response.body).to include store.name
    end

    it "住所がレスポンスに含まれること" do
      expect(response.body).to include store.address
    end

    it "最寄駅がレスポンスに含まれること" do
      expect(response.body).to include store.nearest_station
    end

    it "レビューの件数が表示されること" do
      expect(response.body).to include store.reviews.count.to_s
    end

    it "レビューの平均点が表示されること" do
      expect(response.body).to include store.avg_score.to_s
    end

    it "レビューの平均点がレビューのスコアで変わること" do
    end
    
  end

  describe "stores#show" do
    before do
      get store_path(store)
    end
    
   

    it "stores_path(:store_id)にパスできること" do
    end

    it "storeのが表示されること" do
    end
    
  end

  describe "stores#new" do
    


    it "storeの新規登録画面にアクセスできること" do
      sign_in @user
      get new_store_path
      expect(response).to have_http_status(200)
    end
    #⬆︎system_specに書く？

    
    
  end

  describe "stores#search" do
    it "店名または都道府県でstoreの全データから検索できること" do 
    end
    
    it "店名または都道府県と合致しないstoreが検索されないこと" do
    end
    
    it "楽器店の登録順でソートできること" do
    end

    it "楽器店のレビューの新しい順にソートできること" do
    end

    it "楽器店のレビューが多い順にソートできること" do
    end

    it "楽器店の平均スコアが高い順にソートできること" do
    end

  end

end
