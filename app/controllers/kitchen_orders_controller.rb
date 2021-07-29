class KitchenOrdersController < ApplicationController
  layout 'kitchen_orders'
  def index
    @orders = Order.where(situation: [0,1]).order("created_at ASC")
  end
end
