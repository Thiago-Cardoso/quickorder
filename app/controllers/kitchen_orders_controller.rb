class KitchenOrdersController < ApplicationController
  layout 'dashboard'
  def index
    @orders = Order.where(situation: [0,1]).order("created_at ASC")
  end
end
