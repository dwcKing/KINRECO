class AddLastNameToEndusers < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD

=======
    add_column :end_users, :last_name, :string
    add_column :end_users, :first_name, :string
    add_column :end_users, :last_kana, :string
    add_column :end_users, :first_kana, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :post_code, :string
    add_column :end_users, :address, :text
    add_column :end_users, :password, :string
>>>>>>> master
    add_column :end_users, :quit_status, :integer

  end
end
