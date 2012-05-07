require 'yaml'
#require_relative 'crawler'

module Tentacles
  class Runner

    attr_reader :config

    def initialize(config)
      @config = YAML.load(File.open(config))
    end

    def run      
      'Runner should be running'
    end
  end
end