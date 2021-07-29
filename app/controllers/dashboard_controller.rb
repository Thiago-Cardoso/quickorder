class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    @orders = Order.all
    @orders_fila = Order.na_fila
    # @orders = Order.na_fila..where(employee_id: current_employee)
    @orders_em_andamento = Order.em_andamento
    @orders_concluido = Order.concluido
    @orders_cancelado = Order.cancelado

    # @sum_orders = ProductOrder.joins('inner join products on products.id = product_orders.product_id').sum(:price).round(2), depois só passar um where created_at pra fazer o filtro

    # if current_employee == admin
    #   @orders = Order.na_fila.count
    # else
    #   @orders = Order.na_fila.where(employee_id: current_employee)
    
    # tenta algo assim pra vc validar o usuario no controller
    # se for admin traz tudo se não traz do usuario logado
  end
end
