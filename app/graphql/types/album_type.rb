module Types
  class AlbumType < Types::BaseObject
    # require 'pry'; binding.pry
    field :id, ID, null: false
    field :title, String, null: false
    field :resource_url, String, null: false
    field :images, [Types::ImagesType], null: false
    field :genres, [String], null: false
    field :styles, [String], null: false
    field :year, Integer, null: false
    field :tracklist, [Types::TracklistType], null: false
    # field :title, String, null: false
    # field :description, String, null: true
    # field :image_url, String, null: true
  end
end