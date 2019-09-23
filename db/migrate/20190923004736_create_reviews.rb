class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float  :rate
      t.text   :content
      t.references :item, foreign_key: true
      t.references :end_user, foreign_key: true

      t.timestamps
    end
  end
end
