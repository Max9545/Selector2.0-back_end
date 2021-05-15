module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :artists, [Types::ArtistType], null: false
    field :year, Integer, null: false
    field :genres, [String], null: false
    field :cover_image, String, null: false
    field :resource_url, String, null: false
    field :images, [Types::ImagesType], null: false
    field :styles, [String], null: false
    field :year, Integer, null: false
    field :tracklist, [Types::TracklistType], null: false
  end
end