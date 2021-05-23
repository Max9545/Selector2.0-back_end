module Types
  class ArtistAlbumsType < Types::BaseObject
    field :artist, String, null: false
    field :title, String, null: true
    field :id, Integer, null: true
    field :cover_image, String, null: true
    field :format, String, null: true
    field :year, Integer, null: true
    field :label, String, null: true
  end
end
