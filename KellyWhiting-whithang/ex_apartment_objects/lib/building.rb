#Building Class
class Building
  attr_accessor :name, :address, :apartments
  #hint apartments should be an array i.e @apartments = []

  def initialize(name, address)
  	@name = name
  	#why does line 16 use name instead of building_name if I assigned it that here?
  	@address = address
  	@apartments =[]
  end

  def view_apartments
  	units = apartments.count
  	0.upto(units - 1) do |units|
  		occupied = apartments[units].is_occupied?(units)
  		puts "Unit \#" + (units +1).to_s + " is the #{apartments[units].name} apartment \
 with #{apartments[units].sqft} sqft,  #{apartments[units].bedrooms} bedrooms, \
 #{apartments[units].bathrooms} bathrooms, and " + occupied
  	end
  end

  def to_s
    "#{name} at #{address} has #{@apartments.count} apartments:"
  end
end
