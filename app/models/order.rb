class Order < ActiveRecord::Base
	has_many :order_items
	belongs_to :food_truck
  attr_accessible :food_truck_id, :status, :total
end
