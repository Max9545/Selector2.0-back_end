module Mutations
  class CreateFavorite < BaseMutation
    # arguments passed to the `resolve` method
    # return type from the mutation

    argument :album_id, Integer, required: true
    argument :title, String, required: true
    argument :artists, String, required: true
    argument :year, Integer, required: true
    argument :genres, String, required: false
    argument :cover_image, String, required: false
    argument :tracklist, String, required: false
    argument :uri, String, required: false

    field :favorite, Types::FavoriteType, null: true
    field :errors, [String], null: false

    def resolve(album_id:, title:, artists:, year:, genres: nil, cover_image: nil, tracklist: nil, uri: nil)
      favorite = Favorite.new(
        album_id: album_id,
        title: title,
        artists: artists,
        year: year,
        genres: genres,
        cover_image: cover_image,
        tracklist: tracklist,
        uri: uri
      )
      if favorite.save!
        {
          favorite: favorite,
          errors: []
        }
      else
        {
          favorite: nil,
          errors: favorite.errors.full_messages
        }
      end
    end
  end
end
