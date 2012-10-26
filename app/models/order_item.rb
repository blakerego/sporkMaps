class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
  attr_accessible :item_id, :note, :order_id, :price, :quantity
end
