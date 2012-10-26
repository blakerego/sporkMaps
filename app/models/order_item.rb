class OrderItem < ActiveRecord::Base
  attr_accessible :item_id, :note, :order_id, :price, :quantity
end
