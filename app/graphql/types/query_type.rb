module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :album, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def album(title)
      DiscogsService.get_album_data(title[:title])
    end

    field :spotify_album_id, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def spotify_album_id(title)
      SpotifyService.spotify_album_id(title[:title])
    end

    field :random_album, [Types::AlbumType], null: false

    def random_album
      DiscogsService.random_ten_albums
    end
  end
end
