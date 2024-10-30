require_relative 'discount'

class SingleItemHalfPrice
  include Discount

  def apply(item, count, prices)
    prices[item] / 2 + prices[item] * (count - 1)
  end
end
