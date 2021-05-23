require 'rails_helper'

RSpec.describe 'Discogs API request', type: :post do
  describe 'Happy Paths' do
    it 'Returns release data for album query params from user', :vcr do

      def query
        <<~GQL
        {
          album(title: "The Payback"){
            id
            title
            artists {
              name
             }
            year
            genres
            coverImage
            resourceUrl
            styles
            year
            tracklist {
              position
              title
              duration
             }
            uri
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["data"].count).to eq(1)
      expect(result["data"]).to be_a(Hash)
      expect(result["data"]).to have_key("album")
      expect(result["data"]["album"].count).to eq(10)
      expect(result["data"]["album"]).to be_a(Hash)
      expect(result["data"]["album"].keys).to match_array(["id", "title", "artists", "year", "genres", "coverImage", "resourceUrl", "styles", "tracklist", "uri"])
      expect(result["data"]["album"]["id"]).to be_a(String)
      expect(result["data"]["album"]["title"]).to be_a(String)
      expect(result["data"]["album"]["artists"]).to be_an(Array)
      expect(result["data"]["album"]["artists"][0]["name"]).to be_a(String)
      expect(result["data"]["album"]["year"]).to be_an(Integer)
      expect(result["data"]["album"]["genres"]).to be_an(Array)
      expect(result["data"]["album"]["genres"][0]).to be_a(String)
      expect(result["data"]["album"]["coverImage"]).to be_a(String)
      expect(result["data"]["album"]["resourceUrl"]).to be_a(String)
      expect(result["data"]["album"]["styles"]).to be_an(Array)
      expect(result["data"]["album"]["styles"][0]).to be_a(String)
      expect(result["data"]["album"]["tracklist"]).to be_an(Array)
      expect(result["data"]["album"]["tracklist"][0].keys).to match_array(["position", "title", "duration"])
      expect(result["data"]["album"]["tracklist"].count).to eq(8)
      expect(result["data"]["album"]["tracklist"][0]["position"]).to be_a(String)
      expect(result["data"]["album"]["tracklist"][0]["title"]).to be_a(String)
      expect(result["data"]["album"]["tracklist"][0]["duration"]).to be_a(String)
    end
    # it 'Returns release data for a random album', :vcr do
    #
    #   def query
    #     <<~GQL
    #     {
    #       randomAlbum {
    #         randomAlbumUri
    #       }
    #     }
    #     GQL
    #   end
    #
    #   result = SelectorSchema.execute(query).as_json
    #   require "pry"; binding.pry
    #   # random = DiscogsService.random_album
    #   # require "pry"; binding.pry
    # end
    it 'Returns release data for 10 random albums' do

      # def query
      #   <<~GQL
      #   {
      #     randomAlbum {
      #       id
      #       title
      #       artists {
      #         name
      #        }
      #       year
      #       genres
      #       coverImage
      #       resourceUrl
      #       styles
      #       year
      #       tracklist {
      #         position
      #         title
      #         duration
      #        }
      #       uri
      #       }
      #     }
      #   GQL
      # end

      # result = SelectorSchema.execute(query).as_json
      # random = DiscogsService.random_album
      # random = DiscogsService.get_artist_id('minus the bear')
      # require "pry"; binding.pry
      # random = DiscogsService.get_artist_albums('minus the bear')
      # random = SpotifyService.spotify_album_id('The Supremes in and out of love')
      # require "pry"; binding.pry
    end
  end
  describe 'Sad Paths' do
    it 'Returns error for blank release data album query params from user', :vcr do

      def query
        <<~GQL
        {
          album(title: ""){
            id
            title
            artists {
              name
             }
            year
            genres
            coverImage
            resourceUrl
            styles
            year
            tracklist {
              position
              title
              duration
             }
            uri
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["data"]["album"]["title"]).to eq("The Battle Of Los Angeles")
    end
    it 'Returns error for gibberish release data album query params from user', :vcr do

      def query
        <<~GQL
        {
          album(title: "dsafserhsthrht"){
            id
            title
            artists {
              name
             }
            year
            genres
            coverImage
            resourceUrl
            styles
            year
            tracklist {
              position
              title
              duration
             }
            uri
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["data"].class).to be(NilClass)
      expect(result["errors"][0]).to eq("Your search returned no results.")
    end
  end
end
