require './lib/passenger'
require './lib/vehicle'
require './lib/park'

RSpec.describe Park do
  it 'exists' do
    yosemite = Park.new("Yosemite", 12.00)

    expect(yosemite).to be_instance_of Park
  end

  it 'there can be multiple unique parks' do
    yosemite = Park.new("Yosemite", 12.00)
    yellowstone = Park.new("Yellowstone", 20.00)

    expect(yosemite).to be_instance_of Park
    expect(yellowstone).to be_instance_of Park
  end

  it 'Park has a unique name' do
    yosemite = Park.new("Yosemite", 12.00)

    expect(yosemite.name).to eq("Yosemite")
  end

  it 'Park has an admission price' do
    yosemite = Park.new("Yosemite", 12.00)

    expect(yosemite.admission_price).to eq(12.00)
  end

  it 'begins with no vehicles in the park' do
    yosemite = Park.new("Yosemite", 12.00)

    expect(yosemite.vehicles_in_park).to eq ([])
  end

  it 'can list all vehicles that entered the park' do
    yosemite = Park.new("Yosemite", 12.00)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2016", "Ford", "F150")
    vehicle_3 = Vehicle.new("2019", "Mazda", "CX5")

    yosemite.enter_park(vehicle_1)
    yosemite.enter_park(vehicle_2)
    yosemite.enter_park(vehicle_3)

    expect(yosemite.vehicles_in_park).to eq([vehicle_1, vehicle_2, vehicle_3])
    expect(yosemite.vehicles_in_park.count).to eq(3)
  end

  it 'vehicles can enter different parks' do
    yosemite = Park.new("Yosemite", 12.00)
    yellowstone = Park.new("Yellowstone", 20.00)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2016", "Ford", "F150")
    vehicle_3 = Vehicle.new("2019", "Mazda", "CX5")

    yosemite.enter_park(vehicle_1)
    yosemite.enter_park(vehicle_2)
    yellowstone.enter_park(vehicle_3)

    expect(yosemite.vehicles_in_park).to eq([vehicle_1, vehicle_2])
    expect(yosemite.vehicles_in_park.count).to eq(2)

    expect(yellowstone.vehicles_in_park).to eq([vehicle_3])
    expect(yellowstone.vehicles_in_park.count).to eq(1)
  end

  it 'begins with no passengers in the park' do
    yosemite = Park.new("Yosemite", 12.00)

    expect(yosemite.passengers_in_park).to eq([])
  end

  it 'can list all of the passengers that entered the park' do
    yosemite = Park.new("Yosemite", 12.00)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2016", "Ford", "F150")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle_1.add_passenger(charlie)
    vehicle_1.add_passenger(jude)
    vehicle_2.add_passenger(taylor)
    expect(vehicle_1.passengers.count).to eq(2)
    expect(vehicle_1.passengers).to eq([charlie, jude])
    expect(vehicle_2.passengers.count).to eq(1)
    expect(vehicle_2.passengers).to eq([taylor])

    expect(yosemite.passengers_in_park).to eq([])

    yosemite.enter_park(vehicle_1)
    yosemite.enter_park(vehicle_2)

    expect(yosemite.passengers_in_park.count).to eq(3)
    expect(yosemite.passengers_in_park).to eq([charlie, jude, taylor])
  end

  it 'can calculate revenue generated' do
    yosemite = Park.new("Yosemite", 12.00)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2016", "Ford", "F150")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle_1.add_passenger(charlie)
    vehicle_1.add_passenger(jude)
    vehicle_2.add_passenger(taylor)
    yosemite.enter_park(vehicle_1)
    yosemite.enter_park(vehicle_2)

    expect(yosemite.passengers_in_park.count).to eq(3)
    expect(yosemite.revenue_generated).to eq(36.00)
  end

  it 'parks will have different revenues based upon passengers in park' do
    yosemite = Park.new("Yosemite", 12.00)
    yellowstone = Park.new("Yellowstone", 20.00)
    grand_canyon = Park.new("Grand Canyon", 25.00)
    vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle_2 = Vehicle.new("2016", "Ford", "F150")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    vehicle_1.add_passenger(charlie)
    vehicle_1.add_passenger(jude)
    vehicle_2.add_passenger(taylor)
    yosemite.enter_park(vehicle_1)
    yellowstone.enter_park(vehicle_2)

    expect(yosemite.passengers_in_park.count).to eq(2)
    expect(yosemite.revenue_generated).to eq(24.00)
    expect(yellowstone.passengers_in_park.count).to eq(1)
    expect(yellowstone.revenue_generated).to eq(20)
    expect(grand_canyon.revenue_generated).to eq(0)
  end
end
