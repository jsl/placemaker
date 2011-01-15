require 'placemaker/document'

module Placemaker
  class XmlParser
    def initialize(xml_body)
      @body = xml_body
      @xml = Nokogiri::XML(xml_body)
    end    
    
    # time in seconds to process the document
    def processing_time
      @xml.xpath('.//xmlns:processingTime', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_f
    end
    
    # version of the software used to process the document 
    def version
      @xml.xpath('.//xmlns:version', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.strip
    end
    
    # length in bytes of the document
    def document_length
      @xml.xpath('.//xmlns:documentLength', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_i  
    end
    
    #  Returns a set of Placemaker::Document objects as containers for content location information
    def documents
      @xml.xpath('//xmlns:document', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').map do |d|
        Placemaker::Document.new(d)
      end
    end
    
  end
end