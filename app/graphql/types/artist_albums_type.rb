module Types
  class ArtistAlbumsType < Types::BaseObject
    field :artist, String, null: false
    field :title, String, null: true
    field :id, Integer, null: true
  end
end
