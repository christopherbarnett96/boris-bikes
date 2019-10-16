require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
    it 'docks something' do
     bike = Bike.new
     expect(subject.dock(bike)).to eq bike
    end
    it { is_expected.to respond_to(:bike) }
    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
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
  end
  describe '#dock' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock Bike.new
      end
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end
