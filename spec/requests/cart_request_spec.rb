require 'rails_helper'

RSpec.describe "Carts", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/cart/show"
      expect(response).to have_http_status(:success)
    end
  end

end
