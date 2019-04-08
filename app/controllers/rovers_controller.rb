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

  def command_from_user
    @command = @view.ask("Type 'R' and the rover will move 90º to the right, 'L' and the rover will move 90º to the left and 'M' for the rover to move one grid point in the current direction")
  end

  def new_localization
    @command.each_char { |command|
      spin_left if command == 'L'
      spin_right if command == 'R'
      move if command == 'M'
    }
  end

  private

  def spin_left
    case command
    when @new_rover[:direction] == 'N'
      @new_rover[:direction] = 'W'
    when @new_rover[:direction] == 'W'
      @new_rover[:direction] = 'S'
    when @new_rover[:direction] == 'S'
      @new_rover[:direction] = 'E'
    when @new_rover[:direction] == 'E'
      @new_rover[:direction] = 'N'
    end
  end

  def spin_right
    case command
    when @new_rover[:direction] == 'N'
      @new_rover[:direction] = 'E'
    when @new_rover[:direction] == 'E'
      @new_rover[:direction] = 'S'
    when @new_rover[:direction] == 'S'
      @new_rover[:direction] = 'W'
    when @new_rover[:direction] == 'W'
      @new_rover[:direction] = 'N'
    end
  end

  def move
    case command
    when @new_rover[:direction] == 'N'
      @new_rover[:latitude] = @new_rover[:latitude] += 1
    when @new_rover[:direction] == 'E'
      @new_rover[:longitude] = @new_rover[:longitude] += 1
    when @new_rover[:direction] == 'S'
      @new_rover[:latitude] = @new_rover[:latitude] -= 1
    when @new_rover[:direction] == 'W'
      @new_rover[:longitude] = @new_rover[:longitude] -= 1
    end
  end
end
