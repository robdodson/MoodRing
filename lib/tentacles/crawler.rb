require 'open-uri'
require 'nokogiri'

require_relative 'selection_error'

module Tentacles
  class Crawler

    attr_reader :doc

    def self.from_uri(uri)
      new(uri)
    end

    def initialize(uri)
      @uri = uri
      @doc = Nokogiri::HTML(open(@uri))
      @counts = Hash.new(0)
    end

    def words_by_selector(selector, ignored_selector = nil)
      node = nodes_by_selector(selector).first
      if ignored_selector
        ignored = node.css(ignored_selector)
        ignored.remove()
      end
      words = words_from_string(node.content)
      count_frequency(words)

      sorted = @counts.sort_by { |word, count| count }
      sorted.reverse!
      sorted.map { |word, count| "#{word}: #{count}"}
    end

    def metadata_by_selector(selector)
      node = nodes_by_selector(selector).first
      metadata = {}
      node.children.each do |child|
        key, *value = child.content.split(':')
        puts "#{key}: #{value}"
      end      
    end

  private

    def nodes_by_selector(selector)
      nodes = doc.css(selector)
      raise Tentacles::SelectionError, 
        'The selector did not return an results!' if nodes.empty?
      nodes
    end 

    def words_from_string(string)
      string.downcase.scan(/[\w']+/)
    end

    def count_frequency(word_list)
      for word in word_list
        @counts[word] += 1
      end
      @counts
    end
  end
end