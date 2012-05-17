require 'yaml'
require_relative 'date_time_format'

module Tentacles
  class Format
    def initialize
      @categories = YAML.load(File.open(File.dirname(__FILE__) + '/formats.yml'))
    end

    # Create a formatter based on the content of the passed
    # in data. Delegate the parse call to this new formatter
    def parse(data)
      category, *content = data.split(':')
      category.downcase!
      formatter = Tentacles.const_get(@categories[category]).new
      formatter.parse(content)
    end
  end
end