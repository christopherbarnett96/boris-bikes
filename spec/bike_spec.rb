require 'bike'

describe Bike do
  it 'Instances of Bike respond to working?' do
    expect(Bike.new).to respond_to(:working?)
  end
end
