class RenameScreenShowsToMovies < ActiveRecord::Migration[6.1]
  def change
    rename_table :screen_shows, :movies
  end
end