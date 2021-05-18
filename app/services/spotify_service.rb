class SpotifyService
  def self.conn
    faraday = Faraday.new(url: 'https://accounts.spotify.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_token
    response = conn.post('/api/token') do |f|
      f.body = { grant_type: 'client_credentials' }
      f.headers['Authorization'] = 'Basic ' + "#{Base64.encode64(ENV['client_info'])}".squish.remove(" ")
    end
    album_q = parse(response)
    album_q
  end
end
