class FoodTruck < ActiveRecord::Base
  attr_accessible :address, :city, :cuisine_type, :first_name, :last_name, :number_of_trucks, :phone, :state, :truck_name, :zipcode
end
