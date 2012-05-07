require_relative '../lib/tentacles/runner'
require 'helpers'

describe Tentacles::Runner do
  include Helpers

  before do
    @runner = Tentacles::Runner.new(relative_path + '/../lib/tentacles/config.yml')
  end

  subject { @runner }

  it { should respond_to(:run) }

  describe "when passing the config file" do
    it "should raise an error if the config file is missing" do
      expect { runner = Tentacles::Runner.new('') }.to raise_error(Errno::ENOENT)
      expect { runner = Tentacles::Runner.new(nil) }.to raise_error(TypeError)
    end

    it "should raise an error if the config file is invalid" do
      expect { runner = Tentacles::Runner.new(relative_path + '/mocks/invalid_yaml.yml') }.to raise_error(Psych::SyntaxError)
    end
  end

end