module GoMaps
  class Address
    def initialize(address)
      @address = address
    end

    def exists?
      location['status'] == 'OK'
    end

    def distance_to(address)
      directions_to(address)['routes'].first['legs'].first['distance']['text'].to_f rescue raise AddressNotFoundException
    end

    private

    def directions_to(address)
      api_response :directions, "origin=#{@address}&destination=#{address}"
    end

    def location
      api_response :geocode, "address=#{@address}"
    end

    def api_response(api, query_string)
      Crack::JSON.parse open(URI.escape(url_for(api) + query_string)).read
    end

    def url_for(api)
      "http://maps.google.com/maps/api/#{api}/json?sensor=false&units=metric&"
    end
  end
end
