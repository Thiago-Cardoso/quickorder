class AddSubtotalToProductOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :product_orders, :unit_price, :decimal
    add_column :product_orders, :total, :decimal
  end
end
