class Dashboard::EmployeesController < DashboardController
  before_action :set_employees, only: %i[edit update destroy]
  before_action :allow_without_password, only: [:update]
  load_and_authorize_resource param_method: :employee_params

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new
    @employee.attributes = employee_params
    if save_employee!
      redirect_to dashboard_employees_path, notice: "#{@employee.name} cadastrada com sucesso!"
    else
      alert_errors
    end
  end

  def edit; end

  def update
    @employee.attributes = employee_params
    if save_employee!
      redirect_to dashboard_employees_path, notice: "#{@employee.name} atualizada com sucesso!"
    else
      alert_errors
    end
  end

  def destroy
    if verify_order
      if @employee.destroy
        redirect_to dashboard_employees_path, notice: "#{@employee.name} excluída com sucesso!"
      else
        alert_errors
      end
   else
     redirect_to dashboard_employees_path, flash: { error: "Não é possivel excluir o usuário #{@employee.name} ele já possui algum pedido feito, somente é permitido desativar" }
   end
 end

  private

  def save_employee!
    @employee.save!
  end

  def verify_order
    @employee_verify =  Order.where(employee: params[:id]).blank?
  end

  def alert_errors
    redirect_to dashboard_employees_path, alert: @employee.errors.full_messages.to_sentence
  end

  def set_employees
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :status, :occupation, :password, :password_confirmation)
  end

  def allow_without_password
    if params[:employee][:password].blank? && params[:employee][:password_confirmation].blank?
      params[:employee].delete(:password)
      params[:employee].delete(:password_confirmation)
    end
  end

end
