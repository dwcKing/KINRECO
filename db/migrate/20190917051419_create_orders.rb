class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_status
      t.integer :delivery_charge
      t.string  :post_code
      t.string  :last_name
      t.string  :first_name
      t.string  :last_kana
      t.string  :first_kana
      t.text    :address
      t.string  :phone_number
      t.integer :payment
      t.references :end_user_id, foreign_key: true

      t.timestamps
    end
  end
end
