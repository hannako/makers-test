require './lib/broadcaster'
require './lib/delivery'
require './lib/material'
require './lib/order'

describe Order do
  subject { Order.new material }
  let(:material) { Material.new 'HON/TEST001/010' }
  let(:material_2) { Material.new 'WNP/SWCL001/010' }
  let(:material_3) { Material.new 'ZDW/EOWW005/010' }
  let(:standard_delivery) { Delivery.new(:standard, 10) }
  let(:express_delivery) { Delivery.new(:express, 20) }

  context 'empty' do
    it 'costs nothing' do
      expect(subject.total_cost).to eq(0)
    end
  end

  context 'with items' do
    it 'returns the total cost of all items' do
      broadcaster_1 = Broadcaster.new(1, 'Viacom')
      broadcaster_2 = Broadcaster.new(2, 'Disney')

      subject.add broadcaster_1, standard_delivery
      subject.add broadcaster_2, express_delivery

      expect(subject.total_cost).to eq(30)
    end
  end

  context 'when discounts are applied' do
    let(:broadcaster_1) { Broadcaster.new(1, 'Disney') }
    let(:broadcaster_2) { Broadcaster.new(2, 'Discovery') }
    let(:broadcaster_3) { Broadcaster.new(3, 'Viacom') }
    let(:broadcaster_4) { Broadcaster.new(4, 'Horse and Country') }

    it 'returns a discounted cost of all items: example 1' do
      order = Order.new(material_2)

      order.add broadcaster_1, standard_delivery
      order.add broadcaster_2, standard_delivery
      order.add broadcaster_3, standard_delivery
      order.add broadcaster_4, express_delivery

      expect(order.total_cost).to eq(45)
    end

    it 'returns a discounted cost of all items: example 2' do
      order = Order.new(material_3)

      order.add broadcaster_1, express_delivery
      order.add broadcaster_2, express_delivery
      order.add broadcaster_3, express_delivery

      expect(order.total_cost).to eq(40.50)
    end
  end
end
