
"""
Temporarily deprecated. A food truck only has one menu so the food trucks will reference the menu_items directly. 
"""

class Menu < ActiveRecord::Base
  has_many :items
  belongs_to :food_truck
  attr_accessible :name
end
