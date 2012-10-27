class Item < ActiveRecord::Base
  belongs_to :menu
  belongs_to :food_truck
  attr_accessible :details, :name, :price, :menu_id
end
