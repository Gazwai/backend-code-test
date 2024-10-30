require_relative 'discount'

class HalfPrice
  include Discount

  def apply(item, count, prices)
    (prices[item] / 2) * count
  end
end
