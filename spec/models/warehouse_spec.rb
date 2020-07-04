require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  subject { described_class.new(wh_code: 'Tamil8989', name: 'Tamil Nadu', pincode: 458906, max_capacity: 20000) }


  describe Warehouse do
    it { should have_many(:products).through(:warehouse_products) }
  end

  describe '.validation' do

    context 'when wh code is not unique' do
      before { described_class.create!(name: "Manjalpur", wh_code: "Tamil8989", pincode: 458906, max_capacity: 20000) }
      it { expect(subject).to be_invalid }
    end

    context 'when wh code is  unique' do
      before { described_class.create!(name: "Manjalpur", wh_code: "TAT9878", pincode: 458906, max_capacity: 20000) }
      it { expect(subject).to be_valid }
    end
  end

  it 'wh code should not be less than 4 character' do
    subject.wh_code = 'Wh3'
    expect(subject).to_not be_valid
  end

  it 'wh code should not be greater than 16 character' do
    subject.wh_code = 'Wh3m456ght78gtt79'
    expect(subject).to_not be_valid
  end
end
