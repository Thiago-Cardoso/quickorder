class Dashboard::CategoriesController < DashboardController
  before_action :set_categories, only: %i[edit update destroy]
  load_and_authorize_resource param_method: :categories_params

  def index
    @categories = Category.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new
    @category.attributes = categories_params
    if save_category!
      redirect_to dashboard_categories_path, notice: "#{@category.description} cadastrada com sucesso!"
    else
      alert_errors
    end
  end

  def update
    @category.attributes = categories_params
    if save_category!
      redirect_to dashboard_categories_path, notice: "#{@category.description} atualizada com sucesso!"
    else
      alert_errors
    end
  end

  def destroy
    if @category.destroy
      redirect_to dashboard_categories_path, notice: "#{@category.description} excluída com sucesso!"
    else
      alert_errors
    end
  end

  private

  def save_category!
    @category.save!
  end

  def alert_errors
    redirect_to dashboard_categories_path, alert: @category.errors.full_messages.to_sentence
  end

  def set_categories
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(:description)
  end
end
