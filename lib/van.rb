require_relative 'docking_station'



class Van
  attr_reader :broken_bikes
  def initialize
    @broken_bikes = []
  end

  def pick_up(location)
    location.bikes.each { |broken_bike|
    @broken_bikes << broken_bike if broken_bike.working? == false }
  end

end
