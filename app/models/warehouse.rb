class Warehouse < ApplicationRecord
  has_many :warehouse_products, dependent: :destroy

  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.threshold ||= 10
    self.count ||= 0
  end
  # def total_count
  #   return 10 unless warehouse_products.size.positive?
  #
  #   avg = reviews.average(:score).to_f.round(2) * 100
  #   update_column(:average_score, avg)
  # end


end
