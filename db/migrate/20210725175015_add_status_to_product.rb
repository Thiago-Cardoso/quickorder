class AddStatusToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :status, :integer
  end
end
