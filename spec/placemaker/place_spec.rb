require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe Placemaker::Place do
  before do
    @xml_str = File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml]))
    @xmlp = Placemaker::XmlParser.new(@xml_str)
    @doc = @xmlp.documents[5]
    @place = @doc.places.first
  end
  
  describe "#woe_id" do
    it "should equal 2442047" do
      @place.woe_id.should == 2442047
    end
  end
  
  describe "place_type" do
    it "should be Town" do
      @place.place_type.should == 'Town'
    end
  end
  
  describe "#name" do
    it "should be Los Angeles, CA, US" do
      @place.name.should == 'Los Angeles, CA, US'
    end
  end
  
  describe "centroid" do
    
    it "should be a Placemaker::Point object" do
      @place.centroid.should be_a(Placemaker::Point)
    end
    
    it "should return an object with lat set to 34.0533" do
      @place.centroid.lat.should == 34.0533
    end
    
    it "should return an object with lng set to -118.245" do
      @place.centroid.lng.should == -118.245
    end
  end
  
  describe "#match_type" do
    it "should be 0" do
      @place.match_type.should == 0
    end
  end
  
  describe "#weight" do
    it "should be 1" do
      @place.weight.should == 1
    end
  end
  
  describe "#confidence" do
    it "should be 9" do
      @place.confidence.should == 9
    end
  end
end