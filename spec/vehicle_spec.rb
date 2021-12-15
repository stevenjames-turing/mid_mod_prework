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

  it "Vehicle begins with no passengers" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.passengers).to eq([])
  end

  it "Vehicle can have multiple passengers" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    expect(vehicle.passengers).to eq([])

    vehicle.add_passenger(charlie)

    expect(vehicle.passengers[0]).to be_instance_of Passenger
    expect(vehicle.passengers.first.name).to eq("Charlie")

    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    expect(vehicle.passengers.count).to eq(3)
    expect(vehicle.passengers[1].name).to eq("Jude")
    expect(vehicle.passengers.last.name).to eq("Taylor")
  end


end
