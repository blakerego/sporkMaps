class Menu < ActiveRecord::Base
  has_many :items
  belongs_to :food_truck
  attr_accessible :name
end
