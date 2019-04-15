
require '../app/models/plateau'

RSpec.describe 'a plateau' do
  it 'has x_axis' do
    raise unless Plateau.new(x_axis: 10, y_axis: 5).x_axis == 10
  end

  it 'has y_axis' do
    raise unless Plateau.new(x_axis: 10, y_axis: 5).y_axis == 5
  end
end
