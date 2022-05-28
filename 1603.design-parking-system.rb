class ParkingSystem

=begin
  :type big: Integer
  :type medium: Integer
  :type small: Integer
=end
  def initialize(big, medium, small)
    @hash = { "1" => big, "2" => medium, "3" => small }
  end


=begin
  :type car_type: Integer
  :rtype: Boolean
=end
  def add_car(car_type)
    car_type = car_type.to_s

    if !@hash[car_type].nil?
      @hash[car_type] -= 1
      @hash[car_type] >= 0
    else
      false
    end
  end


end

# Your ParkingSystem object will be instantiated and called as such:
# obj = ParkingSystem.new(big, medium, small)
# param_1 = obj.add_car(car_type)


# obj = ParkingSystem.new(1, 1, 0)
# obj.add_car(1)
# obj.add_car(2)
# obj.add_car(3)
# obj.add_car(1)