require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }
    it { is_expected.to respond_to(:bikes) }
    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end
    it 'releases a bike' do
      bike = double(:bike, working?: true)
      released_bike = subject.dock(bike)
      expect(subject.release_bike).to eq released_bike
    end
    it 'releases working bikes' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
    it 'does not release broken bikes' do
      bike = double(:bike, working?: false)
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
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end
    it 'docks something' do

      expect(subject.dock(bike)).to eq bike
    end
  end
end
