class HalfPrice
  def apply(item, count, prices)
    (prices[item] / 2) * count
  end
end
