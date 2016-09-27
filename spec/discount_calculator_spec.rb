# require './lib/discount_calculator'
#
# describe DiscountCalculator do
#
#   let(:material) { Material.new 'HON/TEST001/010' }
#   let(:order) { Order.new material }
#   let(:standard_delivery) { Delivery.new(:standard, 10) }
#   let(:express_delivery) { Delivery.new(:express, 20) }
#   let(:broadcaster_1) { Broadcaster.new(1, 'Viacom')}
#   let(:broadcaster_2) { Broadcaster.new(2, 'Disney')}
#   let(:discount_on_total) { Discount.new(:total, 0.9, 30) }
#   let(:discount_on_express) { Discount.new(:express, 0.75, 3) }
#   let(:discount_qualifier) { DiscountQualifier.new }
#
#   discount_calculator = DiscountCalculator.new
#
#   # it 'has a total method' do
#   #   4.times{ order.add broadcaster_1, standard_delivery }
#   #   total = discount_calculator.total(order.items, discount_on_total)
#   #   expect(total).to eq 36
#   # end
#
#
#
#
#
#
#
# end
