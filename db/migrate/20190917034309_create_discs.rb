class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :disc
      t.references :item_id, foreign_key: true

      t.timestamps
    end
  end
end
