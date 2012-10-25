class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :truck_name
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :cuisine_type
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :address
      t.integer :number_of_trucks

      t.timestamps
    end
  end
end
