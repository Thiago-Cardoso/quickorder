require 'rails_helper'

RSpec.describe "ProductOrders", type: :request do

  describe "GET /update" do
    it "returns http success" do
      get "/product_orders/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/product_orders/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/product_orders/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
