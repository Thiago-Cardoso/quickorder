require 'rails_helper'

RSpec.describe Dashboard::CategoriesController, type: :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:employee]
    @current_employee = FactoryBot.create(:employee)
    @categories = FactoryBot.create(:category)
    sign_in @current_employee
  end

  describe "as a Guest" do
    context "#index" do
      subject { get :index }
      it "responds a 200 response" do
        @current_employee
        expect(subject).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    before(:each) do
      @categories = attributes_for(:category)
      post :create, params: {category: @categories}
    end

    it "Redirect to new categories" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/dashboard/categories")
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "Destroy category" do
      it "returns http success" do
        category = create(:category)
        delete :destroy, params: {id: category}
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_category_attributes = attributes_for(:category)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "updates the requested categories" do
      before(:each) do
        category = create(:category)
        put :update, params: {id: category.id, category: @new_category_attributes}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
