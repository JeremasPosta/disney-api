class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name,     default: "" 
      t.string :image,    default: "non_character.png"
      t.integer :age,     default: 0
      t.integer :weight,  default: 0
      t.text :history,    default: ""
      t.text :filmography,default: ""

      t.timestamps
    end
  end
end
