class DiscogsService
  def self.conn
    faraday = Faraday.new(url: 'https://api.discogs.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_album(album)
    response = conn.get('/database/search') do |f|
      f.params['key'] = 'AFcwKjXbJFZHYnHlIdje'
      f.params['secret'] = 'lmOhJlbzEyLbjyrTosVYmRZiSClBZVqT'
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
    self.get_album_resource(album)
  end
end
