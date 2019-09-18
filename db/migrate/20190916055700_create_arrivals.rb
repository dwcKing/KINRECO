class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :arrivals_quantity
      t.integer :item_id
      t.integer :arrivals_date

      t.timestamps
    end
  end
end
