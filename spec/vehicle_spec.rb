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

  it 'initializes with a make' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.make).to eq("Honda")
  end

  it 'initializes with a model' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.model).to eq("Civic")
  end

  it 'vehicle begins not speeding' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.speeding?).to be false
  end

  it 'vehicle can speed' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    expect(vehicle.speeding?).to be false

    vehicle.speed

    expect(vehicle.speeding?).to be true
  end

end
