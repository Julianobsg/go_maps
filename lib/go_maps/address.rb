module GoMaps
  class Address
    def initialize(address)
      @address = address
    end

    def exists?
      GoMaps.parse_location_from(@address)['status'] == 'OK'
    end

    def distance_to(address)
      GoMaps.parse_distance_from "origin=#{@address}&destination=#{address}"
    end
  end
end

