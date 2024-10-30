require 'rspec'
require 'discount_database'
require 'half_price'

RSpec.describe DiscountDatabase do
  let(:discount_db) { DiscountDatabase.new }


  it 'adds and fetches discounts' do
    discount_db.add_discount(:banana, HalfPrice.new)
    expect(discount_db.fecth_discount(:banana)).to be_a(HalfPrice)
  end
end
