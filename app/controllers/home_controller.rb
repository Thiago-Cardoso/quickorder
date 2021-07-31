class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    @product_orders = current_order.product_orders.new
  end
end
