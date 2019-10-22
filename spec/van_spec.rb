require 'van'
require 'bike'
require 'docking_station'

describe Van do

  describe '#pick_up' do

    it 'Van Only picks up broken bikes' do
      bike = double(:bike, working?: true)
      docking_station = DockingStation.new
      docked_bike = docking_station.dock(bike)
      subject.pick_up(docking_station)
      expect(subject.broken_bikes[0]).to eq nil
    end
    it 'Van picks up all broken bikes from Docking Station' do
      docking_station = DockingStation.new
      bike1 = double(:bike, working?: false)
      bike2 = double(:bike, working?: true)
      3.times {docking_station.dock(bike1)}
      3.times {docking_station.dock(bike2)}
      subject.pick_up(docking_station)
      expect(subject.broken_bikes).to eq [bike1,bike1,bike1]
    end
  end
end
