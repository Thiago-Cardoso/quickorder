class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :type
      t.references :order, null: true, foreign_key: true

      t.timestamps
    end
  end
end
