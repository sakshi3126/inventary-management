class CreateWarehouseProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_products do |t|
      t.integer :item_count
      t.boolean :low_item_threshold
      t.references :product, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
