class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
