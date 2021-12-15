require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  it 'exists' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle).to be_instance_of(Vehicle)
  end

  it 'initializes with a year' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.year).to eq("2001")
  end

  xit 'initializes with a make' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
  end

  xit 'initializes with a model' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
  end
end
