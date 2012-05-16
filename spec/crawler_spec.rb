require_relative '../lib/tentacles/crawler'
require 'fakeweb'

describe Tentacles::Crawler do

  before do
    # Create a mock options object
    @options = {
      uri: 'http://robdodson.me', 
      post_selector: '.entry-content',
      metadata_selector: '.entry-content ul:last-child'
    }

    # Create a mock web request
    FakeWeb.register_uri(:get, @options[:uri],
                         :body => '<div class="' + @options[:post_selector].delete(".") + 
                         '">Hello Hello Hello World World Foobar!' +
                           '<ul>' +
                             '<li>Time: 8:03 am</li>' +
                             '<li>Mood: Happy, Drowsy, Peaceful</li>' +
                             '<li>Sleep: 5.5</li>' +
                             '<li>Hunger: 3</li>' +
                             '<li>Coffee: 0</li>' +
                           '</ul>' +
                         '</div>')
  end
  
  describe "constructors" do
    describe "#from_uri" do
      it "should respond" do
        Tentacles::Crawler.should respond_to(:from_uri)
      end

      it "should return an instance" do
        crawler = Tentacles::Crawler.from_uri(@options[:uri])
        crawler.should be_an_instance_of(Tentacles::Crawler)
      end
    end
  end

  describe "instances" do
    before do
      @crawler = Tentacles::Crawler.from_uri(@options[:uri])
    end

    subject { @crawler }

    shared_examples_for "all selector methods" do
      describe "when selection has no nodes" do
        it "should raise an exception" do
          expect { @crawler.send(selector_method, 'some-gibberish-selector') }.to raise_error(Tentacles::SelectionError, 'The selector did not return an results!')  
        end
      end
    end

    it { should respond_to(:words_by_selector) }
    it { should respond_to(:metadata_by_selector) }

    context "post-construct" do
      it "should have the right document" do
        @crawler.doc.content.should =~ /Hello Hello Hello World World Foobar!/
      end
    end

    describe "#words_by_selector" do
      it_behaves_like "all selector methods" do
        let(:selector_method) { :words_by_selector }
      end

      it "should produce an Array of keywords" do
        expected_array = ['hello: 3', 'world: 2', 'foobar: 1']
        actual_array = @crawler.words_by_selector(@options[:post_selector], 'ul:last-child')
        actual_array.should eq(expected_array)
      end
    end

    describe "#metadata_by_selector" do
      it_behaves_like "all selector methods" do
        let(:selector_method) { :metadata_by_selector }
      end

      it "should produce a Hash of metadata" do
        @crawler.metadata_by_selector(@options[:metadata_selector])
      end
    end
  end
end







