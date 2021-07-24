class HomeController < ApplicationController
  def index
    flash.now[:error] = "Oba"
  end
end
