class Order < ActiveRecord::Base
	has_many :order_items
	belongs_to :food_truck
  attr_accessible :food_truck_id, :status, :total

  before_save :calculateOrderTotal

  def calculateOrderTotal
  	"""
    sum = 0
    self.order_items.each do |item|
      sum += item.price
    end
    self.update_attributes(:total => sum)
    puts 'updating attributes after calculation'
    """
  end

end
