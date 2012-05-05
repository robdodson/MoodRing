require_relative '../lib/tentacles/options'

describe Tentacles::Options do
  
  before { @options = Tentacles::Options.new }
  subject { @options }

  it { should respond_to(:url) }
  it { should respond_to(:anchor_selector) }
  it { should respond_to(:content_selector) }

end