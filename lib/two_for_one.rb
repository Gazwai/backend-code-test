class TwoForOne
  def apply(item, count, prices)
    (count / 2 + count % 2) * price[item]
  end
end
