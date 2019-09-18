class AddEndUserIdToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :end_user_id, :integer
  end
end
