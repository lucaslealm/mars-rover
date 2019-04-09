require_relative '../models/rover'
require_relative '../views/rover_view'
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
    p @new_rover
    @command = @view.ask("Type a sentence with the following commands: 'R' and the rover will move 90º to the right, 'L' and the rover will move 90º to the left and 'M' for the rover to move one grid point in the current direction")
    p @command
  end

  def new_localization
    command_from_user
    @command.each_char do |letter|
      print `clear`
      # spin_left if letter == 'L'
      # spin_right if letter == 'R'
      # move if letter == 'M'
      if letter.capitalize == 'L'
        spin_left
      elsif letter.capitalize == 'R'
        spin_right
      elsif letter.capitalize == 'M'
        move
      else
        puts "#{letter} is an invalid command. Please type 'L', 'R' or 'M'"
      end
    end
  end

  private

  def spin_left
    case @new_rover.direction
    when 'N' then @new_rover.direction = 'W'
    when 'W' then @new_rover.direction = 'S'
    when 'S' then @new_rover.direction = 'E'
    when 'E' then @new_rover.direction = 'N'
    end
  end

  def spin_right
    case @new_rover.direction
    when 'N' then @new_rover.direction = 'E'
    when 'W' then @new_rover.direction = 'N'
    when 'S' then @new_rover.direction = 'W'
    when 'E' then @new_rover.direction = 'S'
    end
  end

  def move
    if @new_rover.direction == 'N'
      @new_rover.latitude = @new_rover.latitude += 1
    elsif @new_rover.direction == 'E'
      @new_rover.longitude = @new_rover.longitude += 1
    elsif @new_rover.direction == 'S'
      @new_rover.latitude = @new_rover.latitude -= 1
    elsif @new_rover.direction == 'W'
      @new_rover.longitude = @new_rover.longitude -= 1
    end
  end
end
