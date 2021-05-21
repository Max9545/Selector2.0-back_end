module Types
  class RandomAlbumType < Types::BaseObject
    field :id, ID, null: true
    field :title, String, null: true
    field :artists, [Types::ArtistType], null: true
    field :year, Integer, null: true
    field :genres, [String], null: true
    field :cover_image, String, null: true
    field :resource_url, String, null: true
    field :styles, [String], null: true
    field :year, Integer, null: true
    field :tracklist, [Types::TracklistType], null: true
    field :uri, String, null: true
    field :random_album, String, null: true
  end
end
