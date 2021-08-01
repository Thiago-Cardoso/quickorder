require 'rails_helper'

RSpec.describe Dashboard::ProductsController, type: :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:employee]
    @current_employee = FactoryBot.create(:employee)
    @product = FactoryBot.create(:product)
    @category = FactoryBot.create(:category)
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
      post :create, params: { product: { name: @product.name,
         description: @product.description,
         price: @product.price,
         category_id: @category.id } }
    end

    it "Redirect to new products" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/dashboard/products")
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "Destroy products" do
      it "returns http success" do
        product = create(:product)
        delete :destroy, params: {id: product.id}
        expect(response).to have_http_status(:success) | have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_product_attributes = attributes_for(:product)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "updates the requested products" do
      before(:each) do
        product = create(:product)
        put :update, params: {id: product.id, product: @new_product_attributes}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
