require 'yaml'

module Tentacles
  class Options

    attr_reader :uri
    attr_reader :post_selector
    attr_reader :metadata_selector

    def initialize(config)
      @config = YAML.load(File.open(config))

      @config.each do |key, value|
        raise IOError, "#{key} is undefined!" if key.nil?
      end

      @uri = URI.parse(@config["uri"])
      raise IOError, 'Invalid uri!' if @uri.scheme.nil? || @uri.host.nil?

      @post_selector = @config["post_selector"]
      @metadata_selector = @config["metadata_selector"]
    end
  end
end