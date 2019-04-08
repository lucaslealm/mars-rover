require_relative '../models/rover'

# Created rovers controller to handle the movement of the rovers and the view.

class RoversController
  def initialize
    @view = RoverView.new
  end

  def create_rover
    latitude = @view.ask("What's the current latitude of the rover on the plateau? (Choose from 0 to 5)")
    longitude = @view.ask("What's the current longitude of the rover on the plateau? (Choose from 0 to 5)")
    direction = @view.ask("What's the current direction of the rover on the plateau? (Type N for North, S for South, E for East and W for West)")
    @new_rover = Rover.new(latitude: latitude,
                           longitude: longitude,
                           direction: direction)
  end

  def move_command

  end


  def move
    #usar each_char!
  end



end
