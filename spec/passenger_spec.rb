require './lib/passenger'

RSpec.describe Passenger do
  it 'exists' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})

    expect(charlie).to be_instance_of(Passenger)
  end

  it 'Passenger initializes with a name' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})

    expect(charlie.name).to eq("Charlie")
  end


end
