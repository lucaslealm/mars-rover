class Plateau
  attr_reader :x_axis, :y_axis

  def initialize(attributes = {})
    @x_axis = attributes[:x_axis].to_i
    @y_axis = attributes[:y_axis].to_i
  end
end
