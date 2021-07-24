class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
