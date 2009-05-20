module Placemaker
  class XmlParser
    def initialize(xml_body)
      @body = xml_body
      @xml = Nokogiri::XML(xml_body)
    end
    
    # Returns a set of documents corresponding to the RSS entries in input data.
    # Returns a collection of Placemaker::Document objects.
    def documents
      @xml.xpath('//xmlns:document', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').map do |d|
        Placemaker::Document.new(d)
      end
    end
    
  end
end