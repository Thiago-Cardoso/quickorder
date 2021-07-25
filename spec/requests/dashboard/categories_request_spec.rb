require 'rails_helper'

RSpec.describe "Dashboard::Categories", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/dashboard/categories/index"
      expect(response).to have_http_status(:success)
    end
  end

end
