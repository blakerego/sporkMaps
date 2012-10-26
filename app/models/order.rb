class Order < ActiveRecord::Base
  attr_accessible :food_truck_id, :status, :total
end
