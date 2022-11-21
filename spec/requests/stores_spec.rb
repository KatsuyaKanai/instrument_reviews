require 'rails_helper'

RSpec.describe "Stores", type: :request do
  let(:store) { create(:store) }
  let(:store2) { create(:store) }
  let(:review) { create(:review, stores: [store]) }
  let(:review2) { create(:review2, stores: [store]) }

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

    # it "店名がレスポンスに含まれること" do
    #   binding.pry
    #   expect(response.body).to have_content store.name
    # end

    # it "住所がレスポンスに含まれること" do
    #   expect(response.body).to have_content store.address
    # end

    # it "最寄駅がレスポンスに含まれること" do
    #   expect(response.body).to have_content store.nearest_station
    # end

    # it "レビューの件数が表示されること" do
    #   expect(response.body).to have_content store.reviews.count
    # end

    # it "レビューの平均点が表示されること" do
    #   expect(response.body).to have_content store.avg_score
    # end

    it "レビューの平均点がレビューのスコアで変わること"
    
  end

  describe "stores#show" do
    before do
      get stores_path(store_id)
    end
    
   

    it "stores_path(:store_id)にパスできること"

    it "storeのが表示されること"
    
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
    it "店名または都道府県でstoreの全データから検索できること"
    

    it "店名または都道府県と合致しないstoreが検索されないこと"
    
  end

end
