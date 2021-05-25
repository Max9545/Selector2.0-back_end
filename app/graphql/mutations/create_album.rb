module Mutations
  class CreateFavorite < BaseMutation
    # arguments passed to the `resolve` method
    # return type from the mutation
    argument :album_id, Integer, required: false
    argument :title, String, required: true
    argument :artists, String, required: false
    argument :year, Integer, required: true
    argument :genres, String, required: false
    argument :coverImage, String, required: false
    argument :tracklist, String, required: false
    argument :uri, String, required: false

    # type Types::FavoriteType
    def resolve(description: nil, url: nil)
      Favorite.create!(
        album_id: album_id,
        title: title,
        artists: artists,
        year: year,
        genres: genres,
        coverImage: coverImage,
        tracklist: tracklist,
        uri: uri
      )
    end
  end
end
