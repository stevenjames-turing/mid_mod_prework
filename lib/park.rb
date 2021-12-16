class Park
  attr_reader :name, :admission_price, :vehicles_in_park, :passengers_in_park

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles_in_park = []
    @passengers_in_park = []
  end

  def enter_park(vehicle)
    @vehicles_in_park << vehicle
    vehicle.passengers.each do |passenger|
      @passengers_in_park << passenger
    end
  end

  def revenue_generated
    @passengers_in_park.count * @admission_price
  end
end
