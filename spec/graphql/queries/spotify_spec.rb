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
end



#   # post graphql_path, params: {album: "The Payback"}
#
#   # https://accounts.spotify.com/api/token
#
#   # SpotifyService.get_token
#   # SpotifyService.spotify_album_id("The Payback")
#   # SpotifyService.spotify_album("The Payback")
#   end
# end
