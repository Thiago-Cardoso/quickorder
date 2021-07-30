class CartController < ApplicationController
  def show
    @product_orders = current_order.product_orders
  end
end
