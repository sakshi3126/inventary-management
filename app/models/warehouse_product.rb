class WarehouseProduct < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  # after_initialize :set_defaults, if: :new_record?
  #
  #
  # # scope :totol_count, -> { sum(:item_count) }
  #
  # def set_defaults
  #   self.low_item_threshold ||= false
  # end


  def low_item_threshold?
    if self.item_count < self.warehouse.threshold
      self.update_attributes(low_item_threshold: true)
    else
      self.update_attributes(low_item_threshold: false)
    end
  end

end
