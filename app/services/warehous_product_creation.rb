class WarehousProductCreation
  attr_accessor :warehouse
  def initialize(warehouse)
    @warehouse = warehouse
  end

  def call
    if warehouse.present?
      products = Product.order(id: :asc).each do |product|
        WarehouseProduct.where(warehouse_id: warehouse.id, product_id: product.id).first_or_create! do |warehouse_product|
          warehouse_product.update(item_count: 0, threshold: 10)
          warehouse_product.low_item_threshold?
        end
      end
    end
  end
end