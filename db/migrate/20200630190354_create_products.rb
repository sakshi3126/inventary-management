class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :sku_code
      t.string :name
      t.decimal :price

      t.timestamps
    end
    add_index :products, :sku_code, unique: true
  end
end
