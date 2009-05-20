require File.join(File.dirname(__FILE__),  %w[ .. spec_helper])

describe Placemaker::XmlParser do
  before do
    @xml_str = File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml]))
    @xmlp = Placemaker::XmlParser.new(@xml_str)
  end
  
  describe "#documents" do
    it "should return 15 documents" do
      @xmlp.documents.size.should == 15
    end
    
    it "should contain all Placemaker::Document objects" do
      @xmlp.documents.all?{|d| d.class == Placemaker::Document}.should be_true
    end
  end
end