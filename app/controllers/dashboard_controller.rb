class DashboardController < ApplicationController
  load_and_authorize_resource
  layout 'dashboard'
  def index

  end
end
