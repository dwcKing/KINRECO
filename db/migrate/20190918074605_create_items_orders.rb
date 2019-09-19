class CreateItemsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :items_orders do |t|
      t.integer :tax_add_price
      t.integer :price
      t.integer :quantity
      t.references :item_id, foreign_key: true
      t.references :order_id, foreign_key: true

      t.timestamps
    end
  end
end
