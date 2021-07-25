class RemoveOrderFromEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_reference :employees, :order, null: false, foreign_key: true
  end
end
