require 'spec_helper'
require 'buy_three_get_one_free'

RSpec.describe BuyThreeGetOneFree do
  context 'when a three for one is applied' do
    it 'returns the discounted price' do
      expect(BuyThreeGetOneFree.new.apply(:mango, 9, {mango: 200})).to eq(1400)
    end
  end
end
