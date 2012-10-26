class AddFoodTruckIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :food_truck_id, :integer
  end
end
