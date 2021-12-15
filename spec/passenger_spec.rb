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

  it 'Passenger initializes with an age' do
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})

    expect(charlie.age).to eq(18)
  end

  it 'there can be multiple passengers' do
   charlie = Passenger.new({"name" => "Charlie", "age" => 18})
   taylor = Passenger.new({"name" => "Taylor", "age" => 12})

   expect(charlie.name).to eq("Charlie")
   expect(charlie.age).to eq(18)
   expect(taylor.name).to eq("Taylor")
   expect(taylor.age).to eq(12)
 end

 it 'passenger is an adult if 18 or older' do
   charlie = Passenger.new({"name" => "Charlie", "age" => 18})
   taylor = Passenger.new({"name" => "Taylor", "age" => 12})

   expect(charlie.adult?).to be true
   expect(taylor.adult?).to be false
 end

 it 'Passenger can become a driver' do
   charlie = Passenger.new({"name" => "Charlie", "age" => 18})
   taylor = Passenger.new({"name" => "Taylor", "age" => 12})
   expect(charlie.driver?).to be false

   charlie.drive

   expect(charlie.driver?).to be true
   expect(taylor.driver?).to be false
 end
end
