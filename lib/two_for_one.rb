require_relative 'discount'

class TwoForOne
  include Discount

  def apply(item, count, prices)
    (count / 2 + count % 2) * prices[item]
  end
end
