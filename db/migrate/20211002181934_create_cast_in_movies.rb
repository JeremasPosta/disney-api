class CreateCastInMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :cast_in_movies do |t|
      t.references :character, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
