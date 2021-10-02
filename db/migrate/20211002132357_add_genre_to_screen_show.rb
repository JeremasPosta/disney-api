class AddGenreToScreenShow < ActiveRecord::Migration[6.1]
  def change
    add_reference :screen_shows, :genre, null: true, foreign_key: true
  end
end
