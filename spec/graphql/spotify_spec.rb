require 'rails_helper'

RSpec.describe 'Spotify API request', type: :post do
  it 'Returns realease data for album query params from user', :vcr do

  # post graphql_path, params: {album: "The Payback"}

  # https://accounts.spotify.com/api/token

  # SpotifyService.get_token
  # SpotifyService.spotify_album_id("The Payback")
  # SpotifyService.spotify_album("The Payback")

  end
end
