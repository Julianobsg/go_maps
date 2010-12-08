module GoMaps
  class Address
    def initialize(address)
      @address = address
    end

    def exists?
      location['status'] == 'OK'
    end

    def distance_to(address)
      route_to(address)['distance']['text'].to_f
    end

    def route_to(address, options = {})
      options[:language] ||= 'en'
      directions_to(address, "&language=#{options[:language]}")['routes'].first['legs'].first rescue raise AddressNotFoundException
    end

    def latitude
      geometry["lat"]
    end

    def longitude
      geometry["lng"]
    end

    private

    def directions_to(address, language)
      api_response :directions, "origin=#{@address}&destination=#{address}#{language}"
    end

    def location
      api_response :geocode, "address=#{@address}"
    end

    def geometry
      @geometry ||= location["results"].first["geometry"]["location"]
    end

    def api_response(api, query_string)
      Crack::JSON.parse open(URI.escape(url_for(api) + query_string)).read
    end

    def url_for(api)
      "http://maps.google.com/maps/api/#{api}/json?sensor=false&units=metric&"
    end
  end
end
