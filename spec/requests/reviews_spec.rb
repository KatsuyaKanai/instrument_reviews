require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  
    let(:store) { create(:store) }
    let(:store2) { create(:store) }
    let(:review) { create(:review, stores: [store]) }
    let(:review2) { create(:review2, stores: [store]) }

  describe "reviews#index" do
    before do
      get store_reviews_path(store)
    end

    it "レビュー一覧のページにアクセスできること" do
      expect(response).to have_http_status(200)
    end

    it "レビューの一覧が表示されること" do
    end

    it "違う店のレビューが表示されないこと" do
    end
  end
  #⬇︎system_specに記入？
  describe "reviews#search" do
    
  end

  

end
