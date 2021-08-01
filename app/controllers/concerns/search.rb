module Search
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_employee!

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

      def search
        if params[:initial_date].present? && params[:final_date].present?
          initial_date_format = DateTime.parse(params[:initial_date]).beginning_of_day
          final_date_format = DateTime.parse(params[:final_date]).end_of_day
          @orders = Order.all.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where.not(situation: 'cancelled').where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)

        elsif params[:initial_date].present? && params[:final_date].blank?
          initial_date_format = DateTime.parse(params[:initial_date]).beginning_of_day
          @orders = Order.all.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where.not(situation: 'cancelled').where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order.where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)

        elsif params[:initial_date].blank? && params[:final_date].present?
          final_date_format = DateTime.parse(params[:final_date]).end_of_day
          @orders = Order.all.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where.not(situation: 'cancelled').where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order.where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)
        end
      end


      def search_user
        if params[:initial_date].present? && params[:final_date].present?
          initial_date_format = DateTime.parse(params[:initial_date]).beginning_of_day
          final_date_format = DateTime.parse(params[:final_date]).end_of_day
          @orders = Order.all.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where.not(situation: 'cancelled').where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order..where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}' and created_at <= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)

        elsif params[:initial_date].present? && params[:final_date].blank?
          initial_date_format = DateTime.parse(params[:initial_date]).beginning_of_day
          @orders = Order.all.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where(employee_id: current_employee).where.not(situation: 'cancelled').where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order.where(employee_id: current_employee).where("created_at >= '#{initial_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)

        elsif params[:initial_date].blank? && params[:final_date].present?
          final_date_format = DateTime.parse(params[:final_date]).end_of_day
          @orders = Order.all.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_status = Order.where(employee_id: current_employee).where.not(situation: 'cancelled').where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").order(situation: :asc).order(id: :asc)
          @orders_queue = Order.queue.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_progress = Order.progress.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_concluded = Order.concluded.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @orders_canceled = Order.canceled.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'")
          @sum_order = Order.where(employee_id: current_employee).where("created_at >= '#{final_date_format.strftime("%Y-%m-%d %H:%M:%S")}'").sum(:total)
        end
      end

  end
end