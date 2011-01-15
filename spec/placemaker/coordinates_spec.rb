require 'spec_helper'

describe Placemaker::Coordinates do
  before do
    xmlp = Placemaker::XmlParser.new(File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml])))
    doc = xmlp.documents[5]
    @coords = doc.place_details.first.place.centroid
  end
  
  it "should be a Placemaker::Coordinates object" do
    @coords.should be_a(Placemaker::Coordinates)
  end
end
