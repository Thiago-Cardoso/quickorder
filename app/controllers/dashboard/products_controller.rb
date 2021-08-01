class Dashboard::ProductsController < DashboardController
  before_action :set_products, only: %i[edit update destroy]
  load_and_authorize_resource param_method: :products_params

  def index
    @products = Product.order(id: :asc)
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to dashboard_products_path, notice: "#{@product.name} cadastrado com sucesso!"
    else
      alert_errors
    end
  end

  def update
    if @product.update(products_params)
      redirect_to dashboard_products_path, notice: "#{@product.name} atualizado com sucesso!"
    else
      alert_errors
    end
  end

  def destroy
    if verify_order
       if @product.destroy
        redirect_to dashboard_products_path, notice: "#{@product.name} excluído com sucesso!"
      else
        alert_errors
      end
    else
      redirect_to dashboard_products_path, flash: { error: "Não é possivel excluir o produto #{@product.name} ele já possui algum pedido feito, somente é permitido desativar" }
    end
  end

  private

  def verify_order
    @product_verify =  ProductOrder.where(product_id: params[:id]).blank?
  end

  def alert_errors
    redirect_to dashboard_products_path, alert: @product.errors.full_messages.to_sentence
  end

  def set_products
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description,
      :price, :category_id, :image, :status)
  end
end
