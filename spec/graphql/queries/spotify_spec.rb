require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'Spotify API request' do
    it 'Returns Album ID for album query params from user', :vcr do

      def query
        <<~GQL
        {
          spotifyAlbumId(title: "The Payback"){
            id
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["data"].count).to eq(1)
      expect(result["data"]).to be_a(Hash)
      expect(result["data"]["spotifyAlbumId"].count).to eq(1)
      expect(result["data"]["spotifyAlbumId"]).to be_a(Hash)
      expect(result["data"]["spotifyAlbumId"]["id"]).to be_a(String)
      expect(result["data"].keys).to match_array ["spotifyAlbumId"]
      expect(result["data"]["spotifyAlbumId"].keys).to match_array ["id"]
    end
  end
  describe 'Sad Paths' do
    it 'Returns error when invalid search title is given', :vcr do

      def query
        <<~GQL
        {
          spotifyAlbumId(title: "fasdfasdfsfgdsfghsdfgas"){
            id
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["errors"][0]).to eq("Your search returned no results.")
    end
    it 'Returns error when blank search title is given', :vcr do

      def query
        <<~GQL
        {
          spotifyAlbumId(title: ""){
            id
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["errors"][0]).to eq("Your search returned no results.")
    end
    it 'Returns error when a one space search title is given', :vcr do

      def query
        <<~GQL
        {
          spotifyAlbumId(title: " "){
            id
          }
        }
        GQL
      end

      result = SelectorSchema.execute(query).as_json

      expect(result["errors"][0]).to eq("Your search returned no results.")
    end
  end
end



#   # SpotifyService.get_token
#   # SpotifyService.spotify_album_id("The Payback")
#   # SpotifyService.spotify_album("The Payback")
