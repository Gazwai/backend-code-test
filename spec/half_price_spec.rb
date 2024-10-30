require 'spec_helper'
require 'half_price'

RSpec.describe HalfPrice do
  context 'when a half price offer is applied' do
    it 'returns the discounted price' do
      expect(HalfPrice.new.apply(:bananas, 1, {bananas: 30})).to eq(15)
    end
  end
end
