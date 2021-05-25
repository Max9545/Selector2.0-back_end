class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :album_id
      t.string :title
      t.string :artists
      t.integer :year
      t.string :genres
      t.string :coverImage
      t.string :tracklist
      t.string :uri

      t.timestamps
    end
  end
end
