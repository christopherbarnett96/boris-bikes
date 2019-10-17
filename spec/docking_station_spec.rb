require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
    it 'docks something' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq bike
    end
    it { is_expected.to respond_to(:bikes) }
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'does not release broken bikes' do
      bike = Bike.new
      bike.report_bike
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
  end

  describe '#capacity' do
    it 'User can change capacity using .capacity' do
      subject.capacity = 26
      expect(subject.capacity).to eq 26
    end
  end

  describe '#dock' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'raises an error when full' do
      subject.capacity.times do
        subject.dock Bike.new
      end
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
