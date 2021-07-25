class AddEmployeeToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :employee, null: false, foreign_key: true
  end
end
