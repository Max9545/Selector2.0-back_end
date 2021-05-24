require 'rails_helper'

describe 'Discogs Service API' do
  describe 'class methods' do
    it '::conn' do
      connection = DiscogsService.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it '::get_album' do
      album = DiscogsService.get_album('War & Leisure')

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

      expect(album[:results][0][:type]).to be_a(String)
      expect(album[:results][0][:genre]).to be_a(Array)

      album[:results][0][:genre].each do |t|
        expect(t).to be_a(String)
      end

      album[:results][0][:style].each do |s|
        expect(s).to be_a(String)
      end

      expect(album[:results][0][:id]).to be_an(Integer)

      album[:results][0][:barcode].each do |b|
        expect(b).to be_a(String)
      end

      expect(album[:results][0][:master_id]).to be_an(Integer)
      expect(album[:results][0][:master_url]).to be_a(String)
      expect(album[:results][0][:uri]).to be_a(String)
      expect(album[:results][0][:catno]).to be_a(String)
      expect(album[:results][0][:title]).to be_a(String)
      expect(album[:results][0][:thumb]).to be_a(String)
      expect(album[:results][0][:cover_image]).to be_a(String)
      expect(album[:results][0][:resource_url]).to be_a(String)
      expect(album[:results][0][:community]).to be_a(Hash)
      expect(album[:results][0][:community].keys).to match_array([:want, :have])
      expect(album[:results][0][:community][:want]).to be_an(Integer)
      expect(album[:results][0][:community][:have]).to be_an(Integer)
    end

    it '::get_album_resource' do
      album = DiscogsService.get_album_resource('War & Leisure')

      expect(album).to be_a(Hash)
      expect(album.keys).to match_array([:id, :main_release, :most_recent_release, :resource_url, :uri, :versions_url, :main_release_url, :most_recent_release_url, :num_for_sale, :lowest_price, :images, :genres, :styles, :year, :tracklist, :artists, :title, :data_quality, :videos, :cover_image])
      expect(album[:id]).to be_an(Integer)
      expect(album[:main_release]).to be_an(Integer)
      expect(album[:most_recent_release]).to be_an(Integer)
      expect(album[:resource_url]).to be_a(String)
      expect(album[:uri]).to be_a(String)
      expect(album[:versions_url]).to be_a(String)
      expect(album[:main_release_url]).to be_a(String)
      expect(album[:most_recent_release_url]).to be_a(String)
      expect(album[:num_for_sale]).to be_an(Integer)
      expect(album[:lowest_price]).to be_an(Float)
      expect(album[:images][0]).to be_a(Hash)
      expect(album[:images][0].keys).to match_array([:type, :uri, :resource_url, :uri150, :width, :height])
      expect(album[:images][0][:type]).to be_a(String)
      expect(album[:images][0][:uri]).to be_a(String)
      expect(album[:images][0][:resource_url]).to be_a(String)
      expect(album[:images][0][:uri150]).to be_a(String)
      expect(album[:images][0][:width]).to be_an(Integer)
      expect(album[:images][0][:height]).to be_an(Integer)
      expect(album[:genres]).to be_an(Array)

      album[:genres].each do |g|
        expect(g).to be_a(String)
      end

      expect(album[:styles]).to be_an(Array)

      album[:styles].each do |s|
        expect(s).to be_a(String)
      end

      expect(album[:year]).to be_an(Integer)
      expect(album[:tracklist]).to be_an(Array)

      album[:tracklist].each do |t|
        expect(t).to be_a(Hash)
        expect(t[:position]).to be_a(String)
        expect(t[:type_]).to be_a(String)
        expect(t[:title]).to be_a(String)
        expect(t[:extraartists]).to be_an(Array)
      end

      expect(album[:tracklist][0][:extraartists]).to be_an(Array)

      album[:tracklist][0][:extraartists].each do |e|
        expect(e).to be_a(Hash)
        expect(e[:name]).to be_a(String)
        expect(e[:anv]).to be_a(String)
        expect(e[:join]).to be_a(String)
        expect(e[:role]).to be_an(String)
        expect(e[:tracks]).to be_an(String)
        expect(e[:id]).to be_an(Integer)
        expect(e[:resource_url]).to be_an(String)
      end

      expect(album[:artists]).to be_an(Array)

      album[:artists].each do |a|
        expect(a).to be_a(Hash)
        expect(a[:name]).to be_a(String)
        expect(a[:anv]).to be_a(String)
        expect(a[:join]).to be_a(String)
        expect(a[:role]).to be_an(String)
        expect(a[:tracks]).to be_an(String)
        expect(a[:id]).to be_an(Integer)
        expect(a[:resource_url]).to be_an(String)
      end

      expect(album[:title]).to be_an(String)
      expect(album[:data_quality]).to be_an(String)

      album[:videos].each do |v|
        expect(v).to be_a(Hash)
        expect(v[:uri]).to be_a(String)
        expect(v[:title]).to be_a(String)
        expect(v[:description]).to be_a(String)
        expect(v[:duration]).to be_an(Integer)
        expect(v[:embed]).to be_a(TrueClass)
      end

      expect(album[:cover_image]).to be_a(String)
    end

    it '::get_album_data' do
      album = DiscogsService.get_album_data('')

      expect(album[:title]).to eq('The Battle Of Los Angeles')
      expect(album[:artists][0][:name]).to eq('Rage Against The Machine')
    end

    xit '::get_artist_id' do
      artist = DiscogsService.get_artist_id('Minus the Bear')

      expect(artist).to be_an(Integer)
    end

    xit '::get_album_resource' do
      albums = DiscogsService.get_artist_albums('Minus the Bear')

      # expect(albums).to be_a(Hash)
    end

    xit '::random_release' do
      range = DiscogsService.random_release

      expect(range).to be_an(Integer)
    end

    it '::random_album' do

    end

  end
end
