module Types
  class FavoriteType < Types::BaseObject
    field :id, ID, null: true
    field :album_id, Integer, null: false
    field :title, String, null: true
    field :artists, String, null: true
    field :year, Integer, null: true
    field :genres, String, null: true
    field :cover_image, String, null: false
    field :tracklist, String, null: false
    field :uri, String, null: false
  end
end
