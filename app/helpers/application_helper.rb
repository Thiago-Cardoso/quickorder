module ApplicationHelper
  def current_order
    # Use Find by id to avoid potential erros
    if Order.find_by_id(session[:order_id]).nil?
      last_id = Order.last
      Order.new(id: last_id.id + 1)
    else
      Order.find_by_id(session[:order_id])
    end
  end
end
