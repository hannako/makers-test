class Discount

attr_accessor :service, :amount, :criteria

  def initialize(service, amount, criteria)
    @amount = amount
    @service = service
    @criteria = criteria
  end




end
