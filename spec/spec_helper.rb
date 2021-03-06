$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'go_maps'
require 'spec'
require 'spec/autorun'
require 'fakeweb'

Spec::Runner.configure do |config|
  FakeWeb.allow_net_connect = false
end

def map_addresses_to_file(address1, address2, file_name, options = {})
  options[:language] ||= "en"
  map_query_string_to_file "origin=#{address1}&destination=#{address2}&language=#{options[:language]}", file_name
end

def map_address_to_file(address, file_name)
  map_query_string_to_file "address=#{address}", file_name
end

def map_query_string_to_file(query_string, file_name)
  api = query_string.include?('destination') ? 'directions' : 'geocode'
  map_url_to_file "http://maps.google.com/maps/api/#{api}/json?sensor=false&units=metric&#{query_string}", file_name
end

def map_url_to_file(url, file_name)
  FakeWeb.register_uri(:get, URI.escape(url), :body => File.open("#{File.dirname(__FILE__)}/data/#{file_name}").read)
end
