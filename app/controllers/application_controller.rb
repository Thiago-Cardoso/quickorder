class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_employee!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def default_url_options
    { host: ENV['DOMAIN'] || 'localhost:3000' }
  end

  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end
end
