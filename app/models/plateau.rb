class Plateau
  attr_reader :max_x_axis, :max_y_axis

  def initialize(attributes = {})
    @max_x_axis = attributes[:max_x_axis].to_i
    @max_y_axis = attributes[:max_y_axis].to_i
  end
end
