require 'crack'
require 'open-uri'
require 'nokogiri'

Dir.glob(File.dirname(__FILE__) + '/go_maps/*.rb').each { |file| require file }

