class OrdersController < ApplicationController
  before_action :set_orders, only: %i[edit update destroy change_situation]

  def index
    @orders = Order.order(id: :asc)
    @categories = Category.all
    @orders_status = Order.where.not(situation: 'cancelled').order(situation: :asc).order(id: :asc)
    @orders_employees = Order.where(employee_id: current_employee).order(situation: :asc).order(id: :asc)
  end

  def new
    @categories = Category.all
    @order = Order.new
  end

  def edit; end

  def create
    if clean_orders && @order.total > 0
      redirect_to orders_path, notice: "Pedido #{@order.id} realizado com sucesso!"
    else
      alert_errors
    end
  end


  def update
    if @order.update(orders_params)
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

  def clean_orders
    @order = Order.new(orders_params)
    nil_elements = @order.product_orders.select {|x| x.quantitie == nil}
    @order.product_orders.delete(nil_elements)
    @order.save
  end


  def alert_errors
    if @order.client_name.blank? || @order.table_number.blank?
      redirect_to orders_path, alert: @order.errors.full_messages.to_sentence
    else
      flash[:error] = "Selecione ao menos um produto"
      redirect_to orders_path
    end
  end

  def set_orders
    @order = Order.find(params[:id])
  end

  def orders_params
    params.require(:order).permit(:client_name, :table_number, :situation, :employee_id,
                                  product_orders_attributes: %i[quantitie note product_id order_id _destroy])
  end
end

