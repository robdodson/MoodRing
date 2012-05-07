require 'open-uri'
require 'nokogiri'

module Tentacles
  class Crawler

    attr_reader :uri
    attr_reader :doc

    def get(uri)
      begin
        @uri = URI.parse(uri)
      rescue URI::BadURIError
        puts 'BadURIError!'
      rescue URI::InvalidURIError
        puts 'InvalidURIError'
      end
      #raise "Missing uri!" if uri.nil? || uri.empty?

      #@doc = Nokogiri::HTML(open(@url))
    end
  end
end

#unless (url =~ URI::ABS_URI).nil?
    # Correct URL
#end
