require 'rails_helper'

RSpec.describe "Maps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/maps/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/maps/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/maps/show"
      expect(response).to have_http_status(:success)
    end
  end

end
