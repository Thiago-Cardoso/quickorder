require 'rails_helper'

RSpec.describe Dashboard::CategoriesController, type: :request do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:employee]
    @current_employee = FactoryBot.create(:employee)
    sign_in @current_employee
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
