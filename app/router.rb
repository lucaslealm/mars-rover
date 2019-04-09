class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to the Mars Rover localization program!"
    puts " --------------------------------------------- "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.create_rover
    when 2 then @controller.new_coordinates
    when 0 then stop
    else
      puts "Please press 1, 2 or 0"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do?"
    puts "1 - Create a new rover"
    puts "2 - Give commands to an existing rover"
    puts "0 - Stop and exit the program"
  end
end