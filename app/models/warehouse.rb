class Warehouse < ApplicationRecord

  has_many :warehouse_products, dependent: :destroy

  validates_uniqueness_of :wh_code
  validate :code_length
  validates_presence_of :wh_code
  validates_presence_of :name
  validates_presence_of :max_capacity
  validates_presence_of :pincode

  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.threshold ||= 10
    self.count ||= 0
  end

  def code_length
    if wh_code.present? && wh_code && (wh_code.length < 8 || wh_code.length > 8)
      errors.add(:wh_code, 'must be 8 digit')
    end
  end


end
