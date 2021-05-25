class SpotifyService
  def self.conn_1
    faraday = Faraday.new(url: 'https://accounts.spotify.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_token
    response = conn_1.post('/api/token') do |f|
      f.body = { grant_type: 'client_credentials' }
      f.headers['Authorization'] = 'Basic ' + "#{Base64.encode64(ENV['client_info'])}".squish.remove(" ")
    end
    album_q = parse(response)
    album_q
  end

  def self.conn_2
    faraday = Faraday.new(url: 'https://api.spotify.com')
  end

  def self.spotify_album_id(album_name)
    token = get_token[:access_token]
    response = conn_2.get('/v1/search') do |f|
      f.params['q'] = album_name
      f.params['type'] = 'album,artist,track'
      f.headers['Authorization'] = 'Bearer ' + "#{token}"
    end
    # require "pry"; binding.pry
    # parse(response)[:albums][:items].empty?
    # album_q = parse(response)
    # if parse(response)[:albums][:items][0][:id]
    album_q = parse(response)[:albums][:items][0][:id]
    # else

    { id: album_q }
  end

  def self.random_spotify_album_id(album_name)
    token = get_token[:access_token]
    response = conn_2.get('/v1/search') do |f|
      f.params['q'] = album_name
      f.params['type'] = 'album,artist,track'
      f.headers['Authorization'] = 'Bearer ' + "#{token}"
    end
    if !parse(response)[:albums][:items].nil? && !parse(response)[:albums][:items].empty? && !parse(response)[:albums][:items].blank?
      album_q = parse(response)[:albums][:items][0][:id]
      { id: album_q }
    else
      DiscogsService.random_album
    end
  end
end
