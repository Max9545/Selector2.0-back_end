require 'rails_helper'

describe 'Spotify Service API' do
  describe 'class methods' do
    it '::conn_1' do
      connection = SpotifyService.conn_1

      expect(connection).to be_a(Faraday::Connection)
    end

    it '::conn_2' do
      connection = SpotifyService.conn_2

      expect(connection).to be_a(Faraday::Connection)
    end

    it '::get_token' do
      token = SpotifyService.get_token

      expect(token).to be_a(Hash)
      expect(token.keys).to match_array([:access_token, :token_type, :expires_in])
      expect(token[:access_token]).to be_a(String)
      expect(token[:token_type]).to be_a(String)
      expect(token[:expires_in]).to be_a(Integer)
    end

    it '::spotify_album_id' do
      album = SpotifyService.spotify_album_id('Dirty Computer')

      expect(album).to be_a(Hash)
      expect(album.keys).to match_array([:id])
      expect(album[:id]).to be_a(String)
    end
  end
end
