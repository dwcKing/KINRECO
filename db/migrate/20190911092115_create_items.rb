class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :artist
      t.integer :disc_type
      t.string :image_id
      t.integer :selling_status
      t.integer :label_id
      t.integer :genre_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
