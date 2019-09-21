class ChangeColumnToArrivals < ActiveRecord::Migration[5.2]
  def change
  	rename_column :arrivals, :item, :item_id
  end
end
