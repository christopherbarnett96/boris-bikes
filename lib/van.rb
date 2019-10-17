require_relative 'docking_station'



class Van

  def initialize
    @van_bikes = []
  end

  def pick_up(bike)
    raise 'Bike is already fixed' if bike.working?
    @van_bikes << bike
    bike
  end

end
