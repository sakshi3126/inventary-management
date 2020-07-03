class WarehouseProduct < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse
  validates :product, presence: true

  validates_uniqueness_of :product_id, scope: :warehouse_id
  validates :threshold, presence: true
  validates :item_count, presence: true


  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.threshold ||= 10
  end


  def low_item_threshold?
    if self.item_count.present?
      if ((self.item_count == 0) || (self.item_count < self.threshold))
        self.update_attributes(low_item_threshold: true)
      else
        self.update_attributes(low_item_threshold: false)
      end
    end
  end

  def to_s
    self.product.name if self.product.present?
  end

end
