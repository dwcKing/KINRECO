class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.string :artist
      t.integer :disc_type
      t.integer :selling_status
      t.text :comment
      t.references :label, foreign_key: true
      t.references :genre, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at


      t.timestamps
    end
  end
end
