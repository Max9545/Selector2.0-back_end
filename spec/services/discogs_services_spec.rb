require 'rails_helper'

describe 'Discogs Service API' do
  describe 'class methods' do
    it '::conn' do
      connection = DiscogsService.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it '::get_album' do
      album = DiscogsService.get_album('War & Leisure')

      require "pry"; binding.pry

      expect(album).to eq(2)
    end

    it '::get_album_resource' do
      album = DiscogsService.get_album_resource('War & Lesire')

      require "pry"; binding.pry

      expect(album).to eq(2)
    end
  end
end
