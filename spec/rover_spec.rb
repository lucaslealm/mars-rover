require './lib/models/rover'

RSpec.describe Rover do
  let(:rover) { Rover.new(latitude: 2, longitude: 5, direction: 'E') }

  it 'has a latitude' do
    expect(rover.latitude).to eq(2)
  end

  it 'has a longitude' do
    expect(rover.longitude).to eq(5)
  end

  it 'has a direction' do
    expect(rover.direction).to eq('E')
  end
end
