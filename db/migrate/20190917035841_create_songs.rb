class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :disc_id, foreign_key: true
      t.string :song_title
      t.integer :song_order

      t.timestamps
    end
  end
end
