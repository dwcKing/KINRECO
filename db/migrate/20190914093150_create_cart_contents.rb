class CreateCartContents < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_contents do |t|
      t.references :item, foreign_key: true
      t.references :end_user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
