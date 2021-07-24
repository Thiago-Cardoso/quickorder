class AddSituationToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :situation, :integer
  end
end
