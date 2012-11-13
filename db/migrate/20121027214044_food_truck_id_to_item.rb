class FoodTruckIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :food_truck_id, :integer
  end
end
