require_relative '../views/rover_view'
require_relative '../views/plateau_view'
# Created rovers controller to handle the movement of the rovers and the view.

class Controller
  def initialize
    @rover_view = RoverView.new
    @plateau_view = PlateauView.new
  end

  def create_plateau
    x_axis = @plateau_view.ask("What's the horizontal size (X axis) of the plateau?")
    y_axis = @plateau_view.ask("What's the vertical size (Y axis) of the plateau?")
    @plateau = Plateau.new(x_axis: x_axis,
                           y_axis: y_axis)
  end

  def create_rover
    if @plateau.nil?
      puts "Please, define a plateau before deploying a new rover."
    else
      longitude = @rover_view.ask("What's the current longitude (X axis) of the rover on the plateau?")
      latitude = @rover_view.ask("What's the current latitude (Y axis) of the rover on the plateau?")
      direction = @rover_view.ask("What's the current direction of the rover on the plateau? (Type N for North, S for South, E for East and W for West)")
      @rover = Rover.new(latitude: latitude,
                         longitude: longitude,
                         direction: direction)
    end
  end

  def new_coordinates
    if @rover.nil?
      puts "Please, deploy a new rover before sending commands."
    else
      command_from_user
      print `clear`
      check_command
      p @command
      @command.each_char do |letter|
        moving_condition(letter)
      end
    end
    final_position
  end

  private

  def command_from_user
    @command = @rover_view.ask("Type a sentence with the following commands without spaces: 'R' and the rover will move 90º to the right, 'L' and the rover will move 90º to the left and 'M' for the rover to move one grid point in the current direction")
  end

  def check_command
    check_command_validity = @command.upcase.split('') - ['L', 'R', 'M']
    puts "Invalid command. Please, type 'R', 'L' or 'M'" unless check_command_validity.empty?
  end

  def moving_condition(letter)
    if letter.capitalize == 'L'
      spin_left
    elsif letter.capitalize == 'R'
      spin_right
    elsif letter.capitalize == 'M'
      move
    end
  end

  def spin_left
    case @rover.direction
    when 'N' then @rover.direction = 'W'
    when 'W' then @rover.direction = 'S'
    when 'S' then @rover.direction = 'E'
    when 'E' then @rover.direction = 'N'
    end
  end

  def spin_right
    case @rover.direction
    when 'N' then @rover.direction = 'E'
    when 'W' then @rover.direction = 'N'
    when 'S' then @rover.direction = 'W'
    when 'E' then @rover.direction = 'S'
    end
  end

  def move
    if @rover.direction == 'N'
      @rover.latitude = @rover.latitude += 1
    elsif @rover.direction == 'E'
      @rover.longitude = @rover.longitude += 1
    elsif @rover.direction == 'S'
      @rover.latitude = @rover.latitude -= 1
    elsif @rover.direction == 'W'
      @rover.longitude = @rover.longitude -= 1
    end
  end

  def final_position
    if @rover.latitude.between?(0, @plateau.y_axis) && @rover.longitude.between?(0, @plateau.x_axis)
      puts "The rover's current position is: #{@rover.longitude} #{@rover.latitude} #{@rover.direction}"
    else
      puts "The rover fell from the plateau. Try deploying another one!"
    end
  end
end
