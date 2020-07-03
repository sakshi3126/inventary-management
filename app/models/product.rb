class Product < ApplicationRecord
  has_many :warehouse_products, inverse_of: :product, dependent: :destroy
  has_many :warehouses, through: :warehouse_products

  accepts_nested_attributes_for :warehouse_products, allow_destroy: true, reject_if: proc { |a| a['product_id'].blank? }

  validates_uniqueness_of :sku_code

  validates_presence_of :sku_code
  validates_presence_of :name
  validates_presence_of :price

  def set_defaults
    self.sku_code ||= generate_sku

  end

  # def get_pickup_quantity
  #   self.total_quantity - self.warehouse_products.sum(&:item_count)
  # end

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
end
