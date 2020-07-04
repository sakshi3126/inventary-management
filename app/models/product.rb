class Product < ApplicationRecord
  has_many :warehouse_products, inverse_of: :product, dependent: :destroy
  has_many :warehouses, through: :warehouse_products

  accepts_nested_attributes_for :warehouse_products, allow_destroy: true, reject_if: proc { |a| a['product_id'].blank? }

  validates_uniqueness_of :sku_code
  validates_length_of :sku_code, is: 8, message: 'Product code should be equal to 8'
  validates_presence_of :sku_code
  validates_presence_of :name
  validates_presence_of :price

  def set_defaults
    self.sku_code ||= generate_sku
  end

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

  def code_length
    if sku_code.present? && (sku_code.length < 8 || sku_code.length > 8)
      errors.add(:sku_code, 'must be 8 digit')
    end
  end


  def self.search(search)
    if search
      Product.all
    else
      Product.all
    end
  end
end
