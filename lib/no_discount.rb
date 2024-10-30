require_relative 'discount'

class NoDiscount
  include Discount

  def apply(item, count, prices)
    prices[item] * count
  end
end
