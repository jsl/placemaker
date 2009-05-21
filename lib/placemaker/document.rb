module Placemaker
  
  class Document
    include Placemaker::XmlHelper
    
    # Returns a Placemaker::Location object that is a container for one named place mentioned in the document 
    def place_details
      @nodeset.search('.//xmlns:placeDetails', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').map do |p|
        Placemaker::PlaceDetails.new(p)
      end
    end
    
    # Returns a Placemaker::Location object that is a container for the smallest administrative place that best describes the document 
    def administrative_scope
      as = @nodeset.search('.//xmlns:administrativeScope', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').first
      Placemaker::Location.new(as) unless as.nil?
    end
    
    # Returns a Placemaker::Location object that is a container for the smallest place that best describes the document 
    def geographic_scope
      gs = @nodeset.search('.//xmlns:geographicScope', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').first
      Placemaker::Location.new(gs) unless gs.nil?
    end
    
    def extents
      extents = @nodeset.search('.//xmlns:extents', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').first
      Placemaker::Extents.new(extents) unless extents.nil?
    end
  end
  
end