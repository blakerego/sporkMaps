class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :food_truck_id
      t.decimal :total
      t.string :status

      t.timestamps
    end
  end
end
