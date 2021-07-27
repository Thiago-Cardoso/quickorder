class KitchenOrdersController < ApplicationController
  layout 'dashboard'
  def index
    @orders = Order.joins(:product_orders).where(situation: [0,1] )
  end
end
