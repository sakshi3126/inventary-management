class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.string :wh_code
      t.string :name
      t.decimal :max_capacity

      t.timestamps
    end
    add_index :warehouses, :wh_code, unique: true
  end
end
