require 'spec_helper'
require 'single_item_half_price'

RSpec.describe SingleItemHalfPrice do
  context 'when a half price offer applies and is restricted to 1 per customer' do
    it 'returns the discounted price' do
      expect(SingleItemHalfPrice.new.apply(:pineapple, 2, {pineapple: 100})).to eq(150)
    end
  end
end
