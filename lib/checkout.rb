# TODO: Tasks and specifications
# [x] Look for instances where code can be refactored to be easier to maintain
# [x] Add tests that might be needed and let it guide development using TTD
# [x] Add new requirements as specified, eg. Mangoes: buy 3 get 1 free
# [ ] SOLID principles where applicable

# [x] Single Responsibility
# [x] Open/Closed
# - Liskov Substitution

# Last two may not be as pertinent depending on progress
# - Interface Separation
# - Dependency Inversion

require_relative 'buy_three_get_one_free'
require_relative 'half_price'
require_relative 'no_discount'
require_relative 'single_item_half_price'
require_relative 'two_for_one'

class Checkout
  attr_reader :prices, :basket
  private :prices, :basket

  def initialize(prices)
    @prices = prices
    @basket = Hash.new(0)
    @discounts = {
      apple: TwoForOne.new,
      banana: HalfPrice.new,
      mango: BuyThreeGetOneFree.new,
      pear: TwoForOne.new,
      pineapple: SingleItemHalfPrice.new
    }
  end

  def scan(item)
    basket[item.to_sym] += 1
  end

  def total
    basket.sum do |item, count|
      discount = @discounts.fetch(item, NoDiscount.new)
      discount.apply(item, count, prices)
    end
  end
end
