require 'van'
require 'bike'
require 'docking_station'

describe Van do

  describe '#pick_up' do
    it { is_expected.to respond_to(:pick_up)}

    it 'Van picks up bikes' do
      bike = double(:bike, working?: false)
      expect(subject.pick_up(bike)).to eq bike
    end

    it 'Van picks up bikes from Docking Station' do
      bike = double(:bike, working?: false)
      docking_station = DockingStation.new
      docked_bike = docking_station.dock(bike)
      expect(subject.pick_up(docked_bike)).to eq docked_bike
    end

    it 'Van Only picks up broken bikes' do
      bike = double(:bike, working?: true)
      docking_station = DockingStation.new
      docked_bike = docking_station.dock(bike)
      expect{ subject.pick_up(docked_bike) }.to raise_error 'Bike is already fixed'
    end

  end
end
