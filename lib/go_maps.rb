require 'crack'
require 'open-uri'
require 'go_maps/address'
require 'go_maps/address_not_found_exception'

module GoMaps
  GOOGLE_GEOCODING_API = 'http://maps.google.com/maps/api/geocode/json?sensor=false&language=pt-BR&'
  GOOGLE_DIRECTIONS_API = 'http://maps.google.com/maps/api/directions/json?sensor=false&language=pt-BR&'

  def self.parse_distance_from(text)
    Crack::JSON::parse(api_response(text))['routes'].first['legs'].first['distance']['text'].gsub(' km', '').gsub(',', '.').to_f rescue raise AddressNotFoundException
  end

  def self.parse_location_from(text)
    Crack::JSON::parse(api_response("address=#{text}"))
  end

  private

  def self.api_response(query_string)
    api_path = query_string.include?('destination') ? GOOGLE_DIRECTIONS_API : GOOGLE_GEOCODING_API
    open(URI.escape("#{api_path}#{query_string}")).read
  end
end
