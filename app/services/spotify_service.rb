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

  def self.spotify_album
    token = get_token[:access_token]
    response = conn_2.get('/v1/search') do |f|
      f.params['q'] = 'The Payback'
      f.params['type'] = 'album'
      f.params['type'] = 'album'
      f.headers['Authorization'] = 'Bearer ' + "#{token}"
    end
    album_q = parse(response)[:albums][:items][0][:id]
    album_q
  end
end
