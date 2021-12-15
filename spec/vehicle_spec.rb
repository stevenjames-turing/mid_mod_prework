require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
  it 'exists' do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle).to be_instance_of(Vehicle)
  end
end
