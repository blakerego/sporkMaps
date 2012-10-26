class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.decimal :price
      t.integer :quantity
      t.text :note

      t.timestamps
    end
  end
end
