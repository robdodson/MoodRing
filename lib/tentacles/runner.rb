require_relative 'crawler'
require_relative 'options'

module Tentacles
  class Runner

    def initialize(argv)
      @options = Options.new(argv)
    end

    def run
=begin      
      finder = Finder.from_file(@options.dictionary)
      @options.words_to_find.each do |word|
        anagrams = finder.lookup(word)
        if anagrams
          puts "Anagrams of #{word}: #{anagrams.join(', ')}"
        else
          puts "No anagrams of #{word} in #{@options.dictionary}"
        end
      end
=end    
    end
  end
end