require File.join(File.dirname(__FILE__),  '..', 'spec_helper')

describe Placemaker::Extents do
  before do
    @xml_str = File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml]))
    @xmlp = Placemaker::XmlParser.new(@xml_str)
    @doc = @xmlp.documents[5]
    @extents = @doc.extents
  end

  it "should be a Placemaker::Extents object" do
    @extents.should be_a(Placemaker::Extents)
  end

  describe "#center" do
    it "should return a Placemaker::Point object" do
      @extents.center.should be_a(Placemaker::Coordinates)
    end
    
    it "should have a lat of 38.8913" do
      @extents.center.lat.should == 38.8913
    end
    
    it "should have a lng of -77.0337" do
      @extents.center.lng.should == -77.0337
    end
  end
  
  describe "#south_west" do
    it "should return a Placemaker::Point object" do
      @extents.south_west.should be_a(Placemaker::Coordinates)
    end
    
    it "should have a lat of 18.9108" do
      @extents.south_west.lat.should == 18.9108
    end
    
    it "should have a lng of -167.276" do
      @extents.south_west.lng.should == -167.276
    end
  end
  
  describe "#north_east" do
    it "should return a Placemaker::Point object" do
      @extents.north_east.should be_a(Placemaker::Coordinates)
    end
    
    it "should have a lat of 72.8961" do
      @extents.north_east.lat.should == 72.8961
    end
    
    it "should have a lng of -66.6879" do
      @extents.north_east.lng.should == -66.6879
    end
  end
end