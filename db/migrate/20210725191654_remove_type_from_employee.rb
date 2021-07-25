class RemoveTypeFromEmployee < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :type, :integer
  end
end
