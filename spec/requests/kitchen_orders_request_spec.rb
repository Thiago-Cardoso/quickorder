require 'rails_helper'

RSpec.describe "KitchenOrders", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/kitchen_orders/index"
      expect(response).to have_http_status(:success)
    end
  end

end
