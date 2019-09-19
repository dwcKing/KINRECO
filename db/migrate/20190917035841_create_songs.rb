class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.string :song_title
      t.integer :song_order

      t.timestamps
    end
  end
end