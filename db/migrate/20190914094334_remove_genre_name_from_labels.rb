class RemoveGenreNameFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :genre_name, :string
  end
end
