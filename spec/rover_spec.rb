require '../app/models/rover'

RSpec.describe 'a rover' do
  it 'has a latitude' do
    raise unless Rover.new(latitude: 2, longitude: 5, direction: 'E').latitude == 2
  end

  it 'has a longitude' do
    raise unless Rover.new(latitude: 2, longitude: 5, direction: 'E').longitude == 5
  end

  it 'has a direction' do
    raise unless Rover.new(latitude: 2, longitude: 5, direction: 'E').direction == 'E'
  end
end
