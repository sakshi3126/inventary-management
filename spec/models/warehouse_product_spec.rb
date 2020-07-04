require 'rails_helper'

RSpec.describe WarehouseProduct, type: :model do
  describe "Associations" do
    it { should belong_to(:product) }
    it { should belong_to(:warehouse) }
  end

  describe "Validations" do
    it { should validate_presence_of(:product) }
  end

  let (:product) {
    Product.new(name: "Anything",
                sku_code: "IM97645g",
                price: 5000)
  }

  let (:warehouse) { Warehouse.new(wh_code: 'Tamil8989', name: 'Tamil Nadu', pincode: 458906)}

  subject {
    described_class.new(item_count: 9,
                        product_id: product.id,
                        warehouse_id: warehouse.id,
                        threshold: 10,
                        low_item_threshold: true
    )
  }

  it "low item threshold should be true if item count < threshold" do
    subject.item_count < subject.threshold
    expect(subject.low_item_threshold).to be(true)
  end

  it 'warehouse should be present' do
    subject.warehouse_id = nil
    expect(subject).to_not be_valid
  end


end
