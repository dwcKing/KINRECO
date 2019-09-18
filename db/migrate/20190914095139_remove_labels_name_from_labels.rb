class RemoveLabelsNameFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :Labels_name, :string
  end
end
