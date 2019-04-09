require_relative '../models/plateau'
require_relative '../views/plateau_view'
# Created plateaus controller to establish the plateau and handle the view/model

class PlateausController
  def initialize
    @view = PlateauView.new
  end

  def create_plateau
    x_axis = @view.ask("What's the horizontal size (X axis) of the plateau?")
    y_axis = @view.ask("What's the vertical size (Y axis) of the plateau?")
    @new_plateau = Plateau.new(max_x_axis: x_axis,
                               max_y_axis: y_axis)
  end
end
