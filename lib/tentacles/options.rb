require 'optparse'

module Tentacles
  class Options

    attr_reader :url
    attr_reader :anchor_selector
    attr_reader :content_selector

    def initialize()
      @url = 'http://robdodson.me/'
      @anchor_selector = '#content h1 a'
      @content_selector = '.entry-content'
    end
  end
end
