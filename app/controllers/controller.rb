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
    if @plateau.nil? # Having a plateau is necessary before creating a rover
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

  # Gets command, checks if letters are valid and returns the new position of the rover
  def new_coordinates
    if @rover.nil? # Having a rover is necessary before giving commands.
      puts 'Please, deploy a new rover before sending commands.'
    else
      command_from_user
      print `clear` # Clears the terminal for better UX.
      check_command
      @command.each_char { |letter| moving_condition(letter) }
    end
    final_position
  end

  private

  def command_from_user
    @command = @rover_view.ask("Type a sentence with the following commands without spaces: 'R' and the rover will move 90º to the right, 'L' and the rover will move 90º to the left and 'M' for the rover to move one grid point in the current direction")
  end

  # Method to check if letters in command are only R, L or M and give feedback to the user.
  def check_command
    check_command_validity = @command.upcase.split('').uniq - ['L', 'R', 'M']
    if check_command_validity.empty? == false && check_command_validity.count > 1
      puts "#{check_command_validity.join(' ')} are invalid commands and were not considered. Please, type only 'R', 'L' or 'M'"
    elsif check_command_validity.empty? == false && check_command_validity.count == 1
      puts "#{check_command_validity.join(' ')} is an invalid command and was not considered. Please, type only 'R', 'L' or 'M'"
    end
  end

  # Defines the conditions for moving the rover based on the commands given by the user.
  def moving_condition(letter)
    spin_left if letter.capitalize == 'L'
    spin_right if letter.capitalize == 'R'
    move if letter.capitalize == 'M'
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
