class Item < ActiveRecord::Base
  belongs_to :menu
  attr_accessible :details, :name, :price, :menu_id
end
