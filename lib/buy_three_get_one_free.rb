class BuyThreeGetOneFree
  def apply(item, count, prices)
    ((count / 4) * 3 + count % 4) * prices[item]
  end
end
