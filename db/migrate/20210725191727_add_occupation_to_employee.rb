class AddOccupationToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :occupation, :integer
  end
end
