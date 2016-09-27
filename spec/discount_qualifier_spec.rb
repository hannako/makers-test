require './lib/discount_qualifier'

describe DiscountQualifier do

  let(:material) { Material.new 'HON/TEST001/010' }
  let(:order) { Order.new material }
  let(:standard_delivery) { Delivery.new(:standard, 10) }
  let(:express_delivery) { Delivery.new(:express, 20) }
  let(:broadcaster_1) { Broadcaster.new(1, 'Viacom')}
  let(:broadcaster_2) { Broadcaster.new(2, 'Disney')}
  let(:discount_on_total) { Discount.new(:total, 0.9, 30) }
  let(:discount_on_express) { Discount.new(:express, 0.75, 3) }
  let(:discount_calculator) { DiscountCalculator.new }
  discount_qualifier = DiscountQualifier.new

  it 'has a express_delivery counter method' do
    4.times{ order.add broadcaster_1, express_delivery }
    expect(discount_qualifier.express_delivery_counter(order.items)).to eq 4
  end

  it 'has a standard_delivery counter method' do
    3.times{ order.add broadcaster_1, standard_delivery }
    order.add broadcaster_2, express_delivery
    expect(discount_qualifier.standard_delivery_counter(order.items)).to eq 3
  end

  it 'has a subtotal method' do
    3.times{ order.add broadcaster_1, standard_delivery }
    order.add broadcaster_2, express_delivery
    expect(discount_qualifier.subtotal(order.items)).to eq 50
  end


  it 'knows if an order qualifies for express discounts' do
    3.times{ order.add broadcaster_1, express_delivery }
    a = discount_qualifier.qualifies_for_express_discount?(order.items,discount_on_express)
    expect(a).to be true
  end

  it 'knows if an order does not qualify for express discounts' do
    3.times{ order.add broadcaster_1, standard_delivery }
    order.add broadcaster_1, express_delivery
    a = discount_qualifier.qualifies_for_express_discount?(order.items,discount_on_express)
    expect(a).to be false
  end

  it 'knows if an order qualifies for a total discount' do
    3.times{ order.add broadcaster_1, express_delivery }
    a = discount_qualifier.qualifies_for_total_discount?(order.items,discount_on_total)
    expect(a).to be true
  end

end
