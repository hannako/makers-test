class DiscountCalculator

  attr_accessor :discount_qualifier

  def initialize
    self.discount_qualifier = DiscountQualifier.new
  end

end
