require_relative '../lib/tentacles/options'
require 'yaml'
require 'uri'
require 'helpers'

describe Tentacles::Options do
  include Helpers

  before do
    @options = Tentacles::Options.new(relative_path + '/../lib/tentacles/config.yml')
  end

  subject { @options }

  it { should respond_to(:uri) }
  it { should respond_to(:post_selector) }
  it { should respond_to(:metadata_selector) }
  
  describe "#initialize" do
    describe "when parsing the URI" do
      
      context "when URI is valid" do
        it "should display the right URI" do
          uri = URI.parse('http://robdodson.me')
          @options.uri.should eq(uri)
        end
      end

      context "when URI is invalid" do
        it "should raise an exception" do
          expect { options = Tentacles::Options.new(relative_path + '/mocks/invalid_uri.yml') }.to raise_error(URI::InvalidURIError)
        end
      end

      context "when URI does not contain a scheme" do
        it "should raise an IO exception" do
          expect { options = Tentacles::Options.new(relative_path + '/mocks/no_scheme_or_host_uri.yml') }.to raise_error(IOError)
        end
      end

      context "when URI does not contain a host" do
        it "should raise an IO exception" do
          expect { options = Tentacles::Options.new(relative_path + '/mocks/no_scheme_or_host_uri.yml') }.to raise_error(IOError)
        end
      end
    end
  end
end