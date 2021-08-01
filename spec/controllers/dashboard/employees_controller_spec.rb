require 'rails_helper'

RSpec.describe Dashboard::EmployeesController, type: :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:employee]
    @current_employee = FactoryBot.create(:employee)
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
      @employees = attributes_for(:employee)
      post :create, params: {employee: @employees}
    end

    it "Redirect to new employee" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/dashboard/employees")
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "Destroy employees" do
      it "returns http success" do
        employee = create(:employee)
        delete :destroy, params: {id: employee.id}
        expect(response).to have_http_status(:success) | have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_employee_attributes = attributes_for(:employee)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "updates the requested employee" do
      before(:each) do
        employee = create(:employee)
        put :update, params: {id: employee.id, employee: @new_employee_attributes}
        expect(response).to have_http_status(:success)
      end
    end
  end
end
