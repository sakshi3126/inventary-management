require 'faker'
#
warehouses = Warehouse.create!([
                                   {
                                       wh_code: (('a'..'z').to_a + ('0'..'9').to_a).sample(12).join,
                                       name: "Mumbai",
                                       pincode: 400072,
                                       max_capacity: 50000
                                   },
                                   {
                                       wh_code: (('a'..'z').to_a + ('0'..'9').to_a).sample(12).join,
                                       name: "New Delhi",
                                       pincode: 110005,
                                       max_capacity: 40000
                                   },
                                   {
                                       wh_code: (('a'..'z').to_a + ('0'..'9').to_a).sample(12).join,
                                       name: "Bangalore",
                                       pincode: 560006,
                                       max_capacity: 30000
                                   }
                               ])


60.times do |item|
  def generate_sku(sku = [])
    length = 5
    alphabets = [*'A'..'Z']
    numbers = [*'0'..'9']

    sku_characters = %w(I M 9)

    length.times do |i|
      if i % 2 == 0
        sku_characters.push(alphabets.sample)
      else
        sku_characters.push(numbers.sample)
      end
    end

    sku = sku_characters.join
    return sku
  end

  products = Product.create!(sku_code: generate_sku,
                             name: Faker::Name.unique.name,
                             price: Faker::Number.between(from: 500.00, to: 15000.00))

end
products = Product.all
mumbai_w = Warehouse.find_by(name: "Mumbai")
products.each do |product|
  warehouse_product_stock = WarehouseProduct.create!(warehouse_id: mumbai_w.id,
                                                     product_id: product.id,
                                                     item_count: rand(15..50000))
  warehouse_product_stock.low_item_threshold?
end

one_third = products.count / 3
half = products.count / 2
two_third = (products.count * 2 / 3)


warehouse = Warehouse.find_by(name: "Bangalore")
products.take(one_third).each do |product|
  warehouse_product_stock = WarehouseProduct.create!(warehouse_id: warehouse.id,
                                                     product_id: product.id,
                                                     item_count: rand(1..9))
  warehouse_product_stock.low_item_threshold?
end


products.take(two_third).each do |product|
  warehouse_product_stock = WarehouseProduct.create!(warehouse_id: warehouse.id,
                                                     product_id: product.id,
                                                     item_count: rand(11..30000))
  warehouse_product_stock.low_item_threshold?
end

delhi = Warehouse.find_by(name: "New Delhi")
products.take(half).each do |product|
  warehouse_product_stock = WarehouseProduct.create!(warehouse_id: delhi.id,
                                                     product_id: product.id,
                                                     item_count: rand(1..9))
  warehouse_product_stock.low_item_threshold?
end

products.take(half).each do |product|
  warehouse_product_stock = WarehouseProduct.create!(warehouse_id: delhi.id,
                                                     product_id: product.id,
                                                     item_count: rand(11..30000))
  warehouse_product_stock.low_item_threshold?
end



