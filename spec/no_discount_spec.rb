require 'spec_helper'
require 'no_discount'

RSpec.describe NoDiscount do
  context 'when no discounts are applied' do
    it 'returns full price' do
      expect(NoDiscount.new.apply(:orange, 3, {orange: 20})).to eq(60)
    end
  end
end
