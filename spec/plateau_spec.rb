require './app/models/plateau'

RSpec.describe Plateau do
  let(:plateau) { Plateau.new(x_axis: 10, y_axis: 5) }

  it 'has x_axis' do
    expect(plateau.x_axis).to eq(10)
  end

  it 'has y_axis' do
    expect(plateau.y_axis).to eq(5)
  end
end
