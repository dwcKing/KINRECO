class RemoveEnduserIdFromCartcontents < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_contents, :enduser_id, :integer
  end
end
