require 'spec_helper'

describe Placemaker::Document do
  before do
    xmlp = Placemaker::XmlParser.new(File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml])))
    @doc = xmlp.documents[5]
  end
    
  describe "#places" do
    it "should have 4 places for the given node" do
      @doc.place_details.size.should == 4
    end
    
    it "should return a Placemaker::PlaceDetails object for the first node" do
      @doc.place_details.first.should be_a(Placemaker::PlaceDetails)
    end
  end
  
  describe "#administrative_scope" do
    it "should have an administrative scope" do
      @doc.administrative_scope.should_not be_nil
    end
    
    it "should return a Placemaker::Location object" do
      @doc.administrative_scope.should be_a(Placemaker::Location)
    end
  end
  
  describe "#geographic_scope" do
    it "should have an geographic scope" do
      @doc.geographic_scope.should_not be_nil
    end
    
    it "should return a Placemaker::Location object" do
      @doc.geographic_scope.should be_a(Placemaker::Location)
    end
  end

  describe "#reference_list" do
    it "should return an array" do
      @doc.reference_list.size.should == 5
    end
    
    it "should contain Reference objects" do
      @doc.reference_list.each do |rl|
        rl.should be_a(Placemaker::Reference)
      end
    end
  end
end