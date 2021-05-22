class DiscogsService

  def self.random_release
    response = Faraday.get('https://api.discogs.com')
    parsed_response = parse(response)
    total_releases = parsed_response[:statistics][:releases]
    rand_release = (0..total_releases).to_a.sample
  end

  def self.random_album
    response = Faraday.get("https://api.discogs.com/releases/#{random_release}")
    parsed_response = parse(response)
    until parsed_response[:formats][0][:descriptions].present? && parsed_response[:formats][0][:descriptions].include?("Album")
      response = Faraday.get("https://api.discogs.com/releases/#{random_release}")
      parsed_response = parse(response)
    end
    # require "pry"; binding.pry
    parsed_interpolated = "#{ parsed_response[:title] }" + ' ' + "#{ parsed_response[:name] }" + ' ' + "#{ parsed_response[:artists][0][:name] }" + ' ' + "#{ parsed_response[:artists_sort] }"
    SpotifyService.spotify_album_id(parsed_interpolated)
  end

  # def self.random_ten_albums
    # require "pry"; binding.pry
    # random_album_array = []
    # require "pry"; binding.pry
    # 5.times do
      # random_album_array << random_album
    # end
    # until random_album_array.count == 5
    #   rand = random_album
    #   # require "pry"; binding.pry
    #   if (!rand.nil?) &&
    #     (!rand[:formats].nil?) && (!rand[:formats][0].nil?) && (!rand[:formats][0][:descriptions].nil?) && (rand != {:message=>"Release not found."}) && (rand[:formats][0][:descriptions].include?("Album" || "LP"))
    #     random_album_array << rand
    #   end
    # end
    # require "pry"; binding.pry
    # random_album_array
  # end

  def self.conn
    faraday = Faraday.new(url: 'https://api.discogs.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_album(album)
    response = conn.get('/database/search') do |f|
      f.params['key'] = ENV['discogs_key']
      f.params['secret'] = ENV['discogs_secret']
      f.params['q'] = album
      f.params['format'] = "album"
    end
    album_q = parse(response)
    album_q
  end

  def self.get_artist_id(artist)
    response = conn.get('/database/search') do |f|
      f.params['key'] = ENV['discogs_key']
      f.params['secret'] = ENV['discogs_secret']
      f.params['q'] = artist
      # f.params['format'] = "artist"
    end
    artist_q = parse(response)
    artist_id = artist_q[:results][0][:id]
    # require "pry"; binding.pry
    artist_id
  end

  def self.get_artist_albums(artist)
    artist_id = get_artist_id(artist)
    response = conn.get("/artists/#{artist_id}/releases") do |f|
      # f.params['artist_id']
      f.params['format'] = "album"
    end
    require "pry"; binding.pry
    artist_q = parse(response)
    artist_q
  end

  def self.get_album_resource(album)
    album_resource = get_album(album)
    require "pry"; binding.pry
    id = album_resource[:results][0][:master_id].to_s
    response = Faraday.get("https://api.discogs.com/masters/#{id}")
    parsed_response = parse(response)
    parsed_response[:cover_image] = album_resource[:results][0][:cover_image]
    parsed_response
  end

  def self.get_album_data(album)
    if album.nil? || album.blank? || album.empty?
      album = "The Battle for Los Angeles"
      self.get_album_resource(album)
    else
      self.get_album_resource(album)
    end
  end
end
