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
    # until parsed_response[:formats][0][:descriptions].include?("Album")
    #   response = Faraday.get("https://api.discogs.com/releases/#{random_release}")
    #   parsed_response = parse(response)
    # end
  end

  def self.random_ten_albums
    random_album_array = []
    10.times do
      random_album_array << random_album
    end
    random_album_array
  end

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

  def self.get_album_resource(album)
    album_resource = get_album(album)
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
