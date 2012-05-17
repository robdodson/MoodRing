require 'chronic'
require 'active_support/core_ext/string/conversions.rb'

module Tentacles
  class DateTimeFormat
    def initialize
      puts 'DateTimeFormat created!'
    end

    def parse(content)
      Chronic.parse(content.join(':')).to_datetime
    end
  end
end