# Tasks and specifications
# [x] Look for instances where code can be refactored to be easier to maintain
# [x] Add tests that might be needed and let it guide development using TTD
# [x] Add new requirements as specified, eg. Mangoes: buy 3 get 1 free
# [x] SOLID principles where applicable
# [x] Implement discount database

# [x] Single Responsibility
# [x] Open/Closed
# [x] Liskov Substitution

# Last two may not be as pertinent depending on progress
# - Interface Separation
# - Dependency Inversion

require_relative 'buy_three_get_one_free'
require_relative 'half_price'
require_relative 'no_discount'
require_relative 'single_item_half_price'
require_relative 'two_for_one'

class Checkout
  attr_reader :prices, :basket, :discount_database
  private :prices, :basket, :discount_database

  def initialize(prices, discount_database)
    @prices = prices
    @basket = Hash.new(0)
    @discount_database = discount_database
  end

  def scan(item)
    basket[item.downcase.to_sym] += 1
  end

  def total
    basket.sum do |item, count|
      discount = @discount_database.fecth_discount(item)
      discount.apply(item, count, prices)
    end
  end
end
