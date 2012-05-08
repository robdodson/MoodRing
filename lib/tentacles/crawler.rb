require 'open-uri'
require 'nokogiri'

module Tentacles
  class Crawler

    attr_reader :uri
    attr_reader :doc

    def get(uri)
      @uri = URI.parse(uri)
      #@doc = Nokogiri::HTML(open(@url))
    end
  end
end

#unless (url =~ URI::ABS_URI).nil?
    # Correct URL
#end
