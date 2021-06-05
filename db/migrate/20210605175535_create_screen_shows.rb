class CreateScreenShows < ActiveRecord::Migration[6.1]
  def change
    create_table :screen_shows do |t|
      t.string :title,     default: "" 
      t.string :image,    default: "non_character.png"
      t.date :realese #release
      t.integer :qualification,  default: 1
      t.text :cast_characters,    default: ""

      t.timestamps
    end
  end
end
