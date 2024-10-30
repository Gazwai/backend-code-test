require 'spec_helper'
require 'two_for_one'

RSpec.describe TwoForOne do
  context 'when a two for one is applied' do
    it 'returns the discounted price' do
      expect(TwoForOne.new.apply(:apple, 2, {apple: 10})).to eq(10)
    end
  end
end
