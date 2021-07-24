class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :client_name
      t.string :table_number

      t.timestamps
    end
  end
end
