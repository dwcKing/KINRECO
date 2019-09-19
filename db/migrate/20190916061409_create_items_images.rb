class CreateItemsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :items_images do |t|
      t.references  :image_id, foreign_key: true
      t.references :item_id, foreign_key: true

      t.timestamps
    end
  end
end
