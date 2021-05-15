module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :album, String, null: false do
    #   argument :title, required: true
    # end

    field :album, Types::AlbumType, null: false do
      argument :title, String, required: true
    end

    def album(title)
      # require 'pry'; binding.pry
      DiscogsService.get_album_data(title[:title])
    end



  #   field :album,
  #         [Types::AlbumType],
  #         null: false,
  #         description: ""
    
  #   def search_album(title)
  #     require 'pry'; binding.pry
  #     @album = Album.new(title)
  #   end
    

  #   field :id, String, null: false,
  #     description: "An example field added by the generator"
  #   def id
  #     # require 'pry'; binding.pry
  #     @album[:id]
  #   end
  end
end
