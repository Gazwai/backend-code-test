class NoDiscount

  # When applying a discount we need the item, number of items and the prices
  def apply(item, count, prices)
    prices[item] * count
  end
end
