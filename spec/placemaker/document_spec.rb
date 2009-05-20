require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe Placemaker::Document do
  before do
    @xml_str = File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml]))
    @xmlp = Placemaker::XmlParser.new(@xml_str)
    @doc = @xmlp.documents[5]
  end

  describe "#places" do
    it "should have 4 places for the given node" do
      @doc.places.size.should == 4
    end
    
    it "should return a Placemaker::Place object for the first node" do
      @doc.places.first.should be_a(Placemaker::Place)
    end
  end
end