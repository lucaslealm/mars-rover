require_relative '../models/rover'

class RoversController
  def initialize
    @view = RoverView.new
  end
end
