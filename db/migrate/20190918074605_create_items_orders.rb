class CreateItemsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :items_orders do |t|
      t.integer :tax_add_price
      t.integer :price
      t.integer :quantity
      t.integer :item_id
      t.integer :order_id

      t.timestamps
    end
  end
end
