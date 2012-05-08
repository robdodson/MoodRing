require 'yaml'
require_relative 'crawler'

module Tentacles
  class Runner

    def initialize(config)
      @config = YAML.load(File.open(config))
    end

    def run      
      
    end
  end
end