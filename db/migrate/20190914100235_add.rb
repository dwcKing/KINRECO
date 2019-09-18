class Add < ActiveRecord::Migration[5.2]
  def change
  	 add_column :labels, :labels_name, :string
  end
end
