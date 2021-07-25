class Dashboard::CategoriesController < DashboardController
  def index
    @categories = Category.all
  end
end
