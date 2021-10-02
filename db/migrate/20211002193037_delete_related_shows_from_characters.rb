class DeleteRelatedShowsFromCharacters < ActiveRecord::Migration[6.1]
  def change
    remove_column :genres, :related_shows

  end
end
