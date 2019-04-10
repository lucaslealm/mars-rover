require_relative '../models/plateau'

# Plateau View created to communicate with the user/controller.

class PlateauView
  def ask(question)
    puts question
    gets.chomp
  end
end
