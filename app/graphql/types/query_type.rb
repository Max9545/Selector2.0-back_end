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
  end
end
