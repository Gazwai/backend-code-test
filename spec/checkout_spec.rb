require 'spec_helper'
require 'checkout'
require 'discount_database'
require 'buy_three_get_one_free'
require 'half_price'
require 'no_discount'
require 'single_item_half_price'
require 'two_for_one'

RSpec.describe Checkout do
  describe '#total' do
    subject(:total) { checkout.total }
    let(:discount_database) {  DiscountDatabase.new }
    let(:prices) {
      {
        apple: 10,
        orange: 20,
        pear: 15,
        banana: 30,
        pineapple: 100,
        mango: 200
      }
    }

    before do
      discount_database.add_discount(:apple, TwoForOne.new)
      discount_database.add_discount(:banana, HalfPrice.new)
      discount_database.add_discount(:mango, BuyThreeGetOneFree.new)
      discount_database.add_discount(:pear, TwoForOne.new)
      discount_database.add_discount(:pineapple, SingleItemHalfPrice.new)
    end


    let(:checkout) { Checkout.new(prices, discount_database) }

    context 'when no discounts are applied' do
      it 'returns total with no discounts' do
        checkout.scan(:mango)
        checkout.scan(:mango)
        expect(checkout.total).to eq(400)
      end
    end

    it 'when item is upcase does not error' do
      checkout.scan(:MANGO)
      expect(checkout.total).to eq(200)
    end
  end

  describe '#scan' do
    let(:discount_database) {  DiscountDatabase.new }

    let(:prices) {
      {
        apple: 10,
        orange: 20,
        pear: 15,
        banana: 30,
        pineapple: 100,
        mango: 200
      }
    }

    let(:checkout) { Checkout.new(prices, discount_database) }

    it 'raises an error when an invalid item is scanned' do
      expect { checkout.scan(:invalid_item) }.to raise_error("Item 'invalid_item' does not exist in the price list")
    end

    it 'adds valid items to the basket correctly' do
      checkout.scan(:apple)
      expect(checkout.basket).to eq({ apple: 1 })
    end
  end
end
