require_relative '../lib/tentacles/crawler'

describe Tentacles::Crawler do
  
  before do 
    @crawler = Tentacles::Crawler.new
  end

  subject { @crawler }

  it { should respond_to(:url) }
  it { should respond_to(:doc) }

  describe "when passing the url" do
    it "should raise an error if empty" do
      expect { @crawler.get('') }.to raise_error("Missing url!")
    end

    it "should raise an error if nil" do
      expect { @crawler.get(nil) }.to raise_error("Missing url!")
    end
  end

end