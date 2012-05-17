require_relative '../lib/tentacles/format'
require 'date'

describe Tentacles::Format do
  describe "when asked to parse some metadata" do
    it "should create the right formatter" do
      @format = Tentacles::Format.new
      @format.parse('Time: 8:03 am').should be_an_instance_of(DateTime)
    end
  end
end