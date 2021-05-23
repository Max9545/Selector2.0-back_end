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

      expect(album).to be_a(Hash)
      expect(album.keys).to match_array([:pagination, :results])
      expect(album[:pagination].keys).to match_array([:page, :pages, :per_page, :items, :urls])
      expect(album[:pagination][:page]).to be_a(Integer)
      expect(album[:pagination][:pages]).to be_a(Integer)
      expect(album[:pagination][:per_page]).to be_a(Integer)
      expect(album[:pagination][:items]).to be_a(Integer)
      expect(album[:pagination][:urls]).to be_a(Hash)
      expect(album[:pagination][:urls].keys).to match_array([:last, :next])
      expect(album[:results]).to be_an(Array)
      expect(album[:results][0].keys).to match_array([:country, :year, :format, :label, :type, :genre, :style, :id, :barcode, :master_id, :master_url, :uri, :catno, :title, :thumb, :cover_image, :resource_url, :community])
      expect(album[:results][0][:country]).to be_a(String)
      expect(album[:results][0][:year]).to be_a(String)
      expect(album[:results][0][:format]).to be_a(Array)

      album[:results][0][:format].each do |f|
        expect(f).to be_a(String)
      end

      album[:results][0][:label].each do |l|
        expect(l).to be_a(String)
      end



      # expect(album[:results][0][:label]).to be_an(Array)
      # expect(album[:results][0][:country]).to be_a(String)
      # expect(album[:results][0][:country]).to be_a(String)
    end

    xit '::get_album_resource' do
      album = DiscogsService.get_album_resource('War & Lesire')

      # require "pry"; binding.pry

      expect(album).to eq(2)
    end
  end
end
