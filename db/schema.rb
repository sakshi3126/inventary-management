# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_30_191202) do

  create_table "products", force: :cascade do |t|
    t.string "sku_code"
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sku_code"], name: "index_products_on_sku_code", unique: true
  end

  create_table "warehouse_products", force: :cascade do |t|
    t.integer "item_count"
    t.boolean "low_item_threshold"
    t.integer "product_id", null: false
    t.integer "warehouse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_warehouse_products_on_product_id"
    t.index ["warehouse_id"], name: "index_warehouse_products_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "wh_code"
    t.string "name"
    t.integer "pincode"
    t.decimal "max_capacity"
    t.integer "count"
    t.integer "threshold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wh_code"], name: "index_warehouses_on_wh_code", unique: true
  end

  add_foreign_key "warehouse_products", "products"
  add_foreign_key "warehouse_products", "warehouses"
end
