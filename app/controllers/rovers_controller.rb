require_relative '../models/rover'

# Created rovers controller to handle the movement of the rovers and the view.

class RoversController
  def initialize
    @view = RoverView.new
  end
end
