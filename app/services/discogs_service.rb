class DiscogsService
  def self.conn
    # require "pry"; binding.pry
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
    album_q = parse(response)[:results][0][:master_id]
    album_q
    # require 'pry'; binding.pry
  end

  def self.get_album_resource(album)
    id = get_album(album).to_s
    response = Faraday.get("https://api.discogs.com/masters/#{id}")
    parse(response)
  end

  def self.get_album_data(album)
    self.get_album_resource(album)
  end
end
