require 'rails_helper'

describe 'Discogs Service API' do
  describe 'class methods' do
    it '::conn' do
      connection = DiscogsService.conn

      expect(connection).to be_a(Faraday::Connection)
    end
  end
end
