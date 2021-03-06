class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_employee!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_employee.cooker?
      kitchen_orders_path
    elsif current_employee.clerk?
      orders_path
    else
      dashboard_path
    end
  end

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end
end
