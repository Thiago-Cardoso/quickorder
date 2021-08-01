require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:employee]
    @current_employee = FactoryBot.create(:employee)
    @order = FactoryBot.create(:order)
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
      post :create, params: { order: { client_name: @order.client_name,
         tale_number: @order.table_number,
         situation: @order.situation,
         employee_id: @current_employee.id } }
    end

    it "Redirect to new orders" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/orders")
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "Destroy orders" do
      it "returns http success" do
        order = create(:order)
        delete :destroy, params: {id: order.id}
        expect(response).to have_http_status(:success) | have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_order_attributes = attributes_for(:order)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "updates the requested orders" do
      before(:each) do
        order = create(:order)
        put :update, params: {id: order.id, order: @new_order_attributes}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
