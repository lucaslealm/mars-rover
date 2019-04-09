require_relative '../models/rover'

# View created to communicate with the user.

class RoverView
  def ask(question)
    puts question
    gets.chomp
  end

end
