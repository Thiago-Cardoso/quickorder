class Dashboard::CategoriesController < DashboardController
  before_action :set_categories, only: %i[edit update destroy]
  def index
    @categories = Category.order(id: :asc)
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to dashboard_categories_path, notice: "#{@category.description} cadastrada com sucesso!"
    else
      alert_errors
    end
  end

  def update
    if @category.update(categories_params)
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
