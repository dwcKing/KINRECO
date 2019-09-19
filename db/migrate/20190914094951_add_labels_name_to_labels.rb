class AddLabelsNameToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :Labels_name, :string
  end
end
