class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.datetime :arrivals_date
      t.integer :arrivals_quantity

      t.timestamps

      t.integer :item_id
    end
  end
end
