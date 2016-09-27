class DiscountQualifier


  def qualifies_for_express_discount?(order,discount)
    (discount.service == :express) && (discount.criteria == express_delivery_counter(order))
  end

  def qualifies_for_standard_discount?(order,discount)
    (discount.service == :standard) && (discount.criteria == standard_delivery_counter(order))
  end

  def qualifies_for_total_discount?(order,discount)
    (discount.service == :total) && (subtotal(order) >= discount.criteria)
  end

  def express_delivery_counter(order)
    order.select{|broadcaster,delivery| delivery.name == :express}.count
  end

  def standard_delivery_counter(order)
    order.select{|broadcaster,delivery| delivery.name == :standard}.count
  end

  def subtotal(order)
    order.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end



end
