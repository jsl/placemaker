require 'spec_helper'

describe Placemaker::Reference do
  before do
    xmlp = Placemaker::XmlParser.new(File.read(File.join(File.dirname(__FILE__), %w[.. fixtures xml_rss_feed_result.xml])))
    doc = xmlp.documents[5]
    @reference = doc.reference_list.first
  end

  describe "#woeIds" do
    it "should be X" do
      @reference.woe_ids.should == '23424977'
    end
  end

  describe "#start" do
    it "should be X" do
      @reference.start.should == '1997'
    end
  end

  describe "#end" do
    it "should be X" do
      @reference.end.should == '2004'
    end
  end

  describe "#text" do
    it "should be Y" do
      @reference.text.should == 'America'
    end
  end

  describe "#xpath" do
    it "should be X" do
      @reference.xpath.should == '/rss[1]/channel[1]/item[6]/description[1]'      
    end
  end
end