class AddFielsToWarehouse < ActiveRecord::Migration[6.0]
  def change
    add_column :warehouses, :pincode, :integer
    add_column :warehouses, :count, :integer
    add_column :warehouses, :threshold, :integer
  end
end
