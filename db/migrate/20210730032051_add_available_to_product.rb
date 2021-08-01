class AddAvailableToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :available, :boolean, default: true
  end
end
