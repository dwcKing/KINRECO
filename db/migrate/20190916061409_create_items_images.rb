class CreateItemsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :items_images do |t|
	  t.string :image_id
	  t.string :item_id

      t.timestamps
    end
  end
end
