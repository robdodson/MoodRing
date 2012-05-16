require 'yaml'
require_relative 'options'
require_relative 'crawler'

module Tentacles
  class Runner

    def initialize(config)
      @options = Tentacles::Options.new(config)
    end

    def run      
      
    end
  end
end