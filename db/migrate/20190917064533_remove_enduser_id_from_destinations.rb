class RemoveEnduserIdFromDestinations < ActiveRecord::Migration[5.2]
  def change
    remove_column :destinations, :enduser_id, :integer
  end
end
