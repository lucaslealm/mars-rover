require_relative '../models/rover'

# Rover View created to display info to the user.

class RoverView
  def ask(question)
    puts question
    gets.chomp
  end
end
