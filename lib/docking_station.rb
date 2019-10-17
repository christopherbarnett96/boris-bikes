require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_accessor :capacity
  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise 'no bikes available' if empty?
    holder = @bikes.pop
    @bikes << holder
    raise 'no bikes available' unless holder.working?
    @bikes.pop
  end

  def dock(bike)
    raise 'Docking station full' if full?
    @bikes << bike
    bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end


end
