require 'rspec'
require ' discount_database'
require 'half_price'

RSpec.describe DiscountDatabase do
  it 'adds and fetches discounts' do
    DiscountDatabase.add_discount(:banana, HalfPrice.new)
    DiscountDatabase.fecth_discount(:banana).to eq(HalfPrice)
  end
end
