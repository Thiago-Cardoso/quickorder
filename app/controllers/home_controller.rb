class HomeController < ApplicationController
  def index
    flash.now[:error] = "Teste Alert"
  end
end
