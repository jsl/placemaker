require 'spec_helper'

describe Placemaker::Location do
  before do
    xmlp = Placemaker::XmlParser.new(File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml])))
    doc = xmlp.documents[5]
    @loc = doc.place_details.first.place
  end
  
  describe "#woe_id" do
    it "should equal 2442047" do
      @loc.woe_id.should == 2442047
    end
  end
  
  describe "place_type" do
    it "should be Town" do
      @loc.location_type.should == 'Town'
    end
  end
  
  describe "#name" do
    it "should be Los Angeles, CA, US" do
      @loc.name.should == 'Los Angeles, CA, US'
    end
  end
  
  describe "centroid" do
    
    it "should be a Placemaker::Point object" do
      @loc.centroid.should be_a(Placemaker::Coordinates)
    end
    
    it "should return an object with lat set to 34.0533" do
      @loc.centroid.lat.should == 34.0533
    end
    
    it "should return an object with lng set to -118.245" do
      @loc.centroid.lng.should == -118.245
    end
  end
  
end