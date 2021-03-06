require 'discount_calculator'

class Order
  COLUMNS = {
    broadcaster: 20,
    delivery: 8,
    price: 8
  }.freeze

  attr_accessor :material, :items, :total_discount, :discount_calculator

  def initialize(material)
    self.material = material
    self.items = []
    self.total_discount = 0
    self.discount_calculator = DiscountCalculator.new
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def apply_discount(order = self.items, discount)
    self.total_discount += discount_calculator.total(order,discount)
  end


  def total_cost
    items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def output
    [].tap do |result|
      result << "Order for #{material.identifier}:"

      result << COLUMNS.map { |name, width| name.to_s.ljust(width) }.join(' | ')
      result << output_separator

      items.each_with_index do |(broadcaster, delivery), index|
        result << [
          broadcaster.name.ljust(COLUMNS[:broadcaster]),
          delivery.name.to_s.ljust(COLUMNS[:delivery]),
          ("$#{delivery.price}").ljust(COLUMNS[:price])
        ].join(' | ')
      end

      result << output_separator
      # result << "Discounts: -$#{discount}"
      result << "Total: $#{total_cost}"
    end.join("\n")
  end

  private

  def output_separator
    @output_separator ||= COLUMNS.map { |_, width| '-' * width }.join(' | ')
  end
end
