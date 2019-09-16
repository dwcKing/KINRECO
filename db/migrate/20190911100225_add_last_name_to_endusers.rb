class AddLastNameToEndusers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :quit_status, :integer

  end
end
