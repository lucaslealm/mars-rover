# Created Rover class and through this it is possible to instantiate a new rover
# with its initial position for later calculating its new position.

class Rover
  attr_accessor :latitude, :longitude, :direction

  def initialize(attributes = {})
    @latitude = attributes[:latitude].to_i
    @longitude = attributes[:longitude].to_i
    @direction = attributes[:direction].capitalize
  end
end
