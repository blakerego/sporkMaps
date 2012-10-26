class FoodTruck < ActiveRecord::Base
"""
  db columns (as of 10/25/2012): 
  t.string :truck_name
  t.string :first_name
  t.string :last_name
  t.string :phone
  t.string :cuisine_type
  t.string :city
  t.string :state
  t.string :zipcode
  t.string :address
  t.integer :number_of_trucks
"""
  has_many :menus
  has_many :orders
  attr_accessible :address, :city, :cuisine_type, :first_name, :last_name, :number_of_trucks, :phone, :state, :truck_name, :zipcode
end
