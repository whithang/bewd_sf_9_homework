require 'pry'
require 'pry-byebug'

class Apartment
  attr_accessor :name, :sqft, :bedrooms, :bathrooms, :renter, :rent

  def initialize(name,sqft,bedrooms,bathrooms)
  	@name = name
  	@sqft = sqft
  	@bedrooms = bedrooms
  	@bathrooms = bathrooms
  	@renter = renter
  	@rent = rent
  end


  def to_s
    "Apartment #{name} has #{sqft} sqft"
  end

   def is_occupied?(units)
   	# binding.pry
   	if renter == nil	
   		return "the apartment is not currently occupied."
   	else
   		return "the apartment is rented by #{renter} for #{rent} per month."
   	end
  end
end
