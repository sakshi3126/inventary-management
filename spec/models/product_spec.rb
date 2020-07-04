require 'rails_helper'
RSpec.describe Product, type: :model do

  let (:product) {
    Product.new(name: "Anything",
                        sku_code: "IM97645g",
                        price: 5000)
  }

  it "is not valid without a name" do
    product.name = nil
    expect(product).to_not be_valid
  end
  # before { product.save }
  it "is valid with valid attributes" do
    expect(product).to be_valid
  end

  it "is not valid without a sku_code" do
    (product.sku_code = nil && product.sku_code.length != 8)
    expect(product).to_not be_valid
  end

  it "Sku_code length should be equal to 8" do
    product.sku_code.length == 8
    expect(product).to be_valid
  end

  it "Sku_code character should be less than 8" do
    product.sku_code = "IM945j"
    expect(product).to_not be_valid
  end

  it "Sku_cpde character should not be greater than  8" do
    product.sku_code = "IM97645jy"
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    product.price = nil
    expect(product).to_not be_valid
  end

end