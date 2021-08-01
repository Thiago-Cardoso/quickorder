class DashboardController < ApplicationController
  layout 'dashboard'
  def index
    if current_employee.occupation == 'admin'
      info_admin
    else
      info_users
    end

    if params[:initial_date].present? && params[:final_date].present?
      initial_date = DataTime.parse(params[:initial_date]).beginning_of_day
      final_date = DataTime.parse(params[:final_date]).end_of_day
      @orders = Order.all.where("creation_date >= '#{inicial_date.strftime("%Y-%m-%d %H:%M:%S")}'")
      @orders = Order.all.where("creation_date >= '#{final_date.strftime("%Y-%m-%d %H:%M:%S")}'")
    elsif params[:initial_date].present? && params[:final_date].blank?
      initial_date = DataTime.parse(params[:initial_date]).beginning_of_day
      @orders = Order.all.where("creation_date >= '#{inicial_date.strftime("%Y-%m-%d %H:%M:%S")}'")
    elsif params[:initial_date].blank? && params[:final_date].present?
      final_date = DataTime.parse(params[:final_date]).end_of_day
      @orders = Order.all.where("creation_date >= '#{final_date.strftime("%Y-%m-%d %H:%M:%S")}'")
    end
    # @sum_orders = ProductOrder.joins('inner join products on products.id = product_orders.product_id').sum(:price).round(2)
  end

  def info_admin
    @orders = Order.all
    @orders_status = Order.where.not(situation: 'cancelled').order(situation: :asc).order(id: :asc)
    @orders_queue = Order.queue
    @orders_progress = Order.progress
    @orders_concluded = Order.concluded
    @orders_canceled = Order.canceled
    @sum_order = Order.sum(:total)
  end

  def info_users
    @orders = Order.all.where(employee_id: current_employee)
    @orders_status = Order.where(employee_id: current_employee).where.not(situation: 'cancelled').order(situation: :asc).order(id: :asc)
    @orders_queue = Order.queue.where(employee_id: current_employee)
    @orders_progress = Order.progress.where(employee_id: current_employee)
    @orders_concluded = Order.concluded.where(employee_id: current_employee)
    @orders_canceled = Order.canceled.where(employee_id: current_employee)
    @sum_order = Order.where(employee_id: current_employee).sum(:total)
  end
end
