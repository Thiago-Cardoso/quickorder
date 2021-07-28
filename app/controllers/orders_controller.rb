class OrdersController < ApplicationController
  before_action :set_orders, only: %i[edit update destroy change_situation]
  def index
    @orders = Order.order(id: :asc)
  end

  def new
    @order = Order.new
  end

  def edit; end

  def create
    @order = Order.new
    @order.attributes = orders_params
    if save_order!
      redirect_to orders_path, notice: "Pedido #{@order.id} realizado com sucesso!"
    else
      alert_errors
    end
  end

  def update
    @order.attributes = orders_params
    if save_order!
      redirect_to orders_path, notice: "Pedido #{@order.id} atualizado com sucesso!"
    else
      alert_errors
    end
  end

  def destroy
    if @order.destroy
      redirect_to orders_path, notice: "Pedido #{@order.id} excluído com sucesso!"
    else
      alert_errors
    end
  end

  def change_situation 
    situation = params[:situation]
    @order.situation = situation.to_i
    @order.save
  end

  private

  def save_order!
    @order.save!
  end

  def alert_errors
    redirect_to orders_path, alert: @order.errors.full_messages.to_sentence
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def orders_params
    params.require(:order).permit(:client_name, :table_number, :situation, :employee_id,
                                  product_orders_attributes: %i[id quantitie note product_id order_id _destroy])
  end
end