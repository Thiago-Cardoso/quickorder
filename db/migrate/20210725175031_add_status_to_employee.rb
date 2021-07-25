class AddStatusToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :status, :integer
  end
end
