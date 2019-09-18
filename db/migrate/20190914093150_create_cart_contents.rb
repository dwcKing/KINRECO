class CreateCartContents < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_contents do |t|
      t.integer :item_id
      t.integer :enduser_id
      t.integer :quantity

      t.timestamps
    end
  end
end
