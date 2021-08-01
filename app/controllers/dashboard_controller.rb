class DashboardController < ApplicationController
  layout 'dashboard'
  include Search

  def index
    if current_employee.occupation == 'admin'
      info_admin
      search
    else
      info_users
      search_user
    end
  end
end
