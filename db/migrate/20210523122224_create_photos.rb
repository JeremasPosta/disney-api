class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      # t.references :user, null: false, foreign_key: true
      t.text :caption
      t.timestamps
    end
  end
end
