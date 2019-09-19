class CreateItemsImages < ActiveRecord::Migration[5.2]
  def change
    create_table :items_images do |t|
      t.references  :image, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
