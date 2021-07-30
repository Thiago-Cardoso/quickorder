class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    if current_employee.occupation == 'admin'
      info_admin
    else
      info_users
    end

    # @sum_orders = ProductOrder.joins('inner join products on products.id = product_orders.product_id').sum(:price).round(2), 
    # depois só passar um where created_at pra fazer o filtro
  end

  def info_admin
    @orders = Order.all
    @orders_queue = Order.queue
    @orders_progress = Order.progress
    @orders_concluded = Order.concluded
    @orders_canceled = Order.canceled
  end

  def info_users
    @orders = Order.all.where(employee_id: current_employee)
    @orders_queue = Order.queue.where(employee_id: current_employee)
    @orders_progress = Order.progress.where(employee_id: current_employee)
    @orders_concluded = Order.concluded.where(employee_id: current_employee)
    @orders_canceled = Order.canceled.where(employee_id: current_employee)
  end
end
