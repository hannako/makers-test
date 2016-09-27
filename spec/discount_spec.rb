require './lib/discount'

describe Discount do
  discount_on_total = Discount.new(:express, 0.9, 30)

  it 'has a value' do
    expect(discount_on_total.amount).to eq 0.9
  end

  it 'has a service' do
    expect(discount_on_total.service).to eq :express
  end

end
