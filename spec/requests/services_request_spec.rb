require 'rails_helper'

RSpec.describe "Services", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/services/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/services/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/services/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/services/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
