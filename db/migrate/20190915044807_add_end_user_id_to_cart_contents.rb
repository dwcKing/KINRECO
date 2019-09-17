class AddEndUserIdToCartContents < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_contents, :end_user_id, :integer
  end
end
