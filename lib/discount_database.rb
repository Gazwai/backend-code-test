class DiscountDatabase
  def initialize(discounts = {})
    @discounts = discounts
  end

  def add_discount(item, discount)
    @discounts[item.downcase.to_sym] = discount
  end

  def fecth_discount(item)
    @discounts.fetch(item.downcase.to_sym, NoDiscount.new)
  end
end
