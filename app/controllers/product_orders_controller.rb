class ProductOrdersController < ApplicationController
  before_action :set_order

  def create
    @product_order = @order.product_orders.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @product_order = @order.product_orders.find(params[:id])
    @product_order.update_attributes(order_params)
    @product_orders = current_order.product_orders
  end

  def destroy
    @product_order = @order.product_orders.find(params[:id])
    @product_order.destroy
    @product_orders = current_order.product_orders
  end

  def order_params
    params.require(:product_order).permit(:quantitie, :note, :product_id)
  end

  def set_order
    @order = current_order
  end
end
