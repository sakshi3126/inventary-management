class AddFielsToWarehouseProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :warehouse_products, :threshold, :integer
  end
end
