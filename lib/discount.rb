module Discount
  def apply(item, count, prices)
    raise NotImplementedError, 'Each discount must implement the apply method'
  end
end
