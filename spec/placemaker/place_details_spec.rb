require 'spec_helper'

describe Placemaker::PlaceDetails do
  before do
    xmlp = Placemaker::XmlParser.new(File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml])))
    doc = xmlp.documents[5]
    @pd = doc.place_details.first
  end
    
  describe "#match_type" do
    it "should be 0" do
      @pd.match_type.should == 0
    end
  end
  
  describe "#weight" do
    it "should be 1" do
      @pd.weight.should == 1
    end
  end
  
  describe "#confidence" do
    it "should be 9" do
      @pd.confidence.should == 9
    end
  end
end