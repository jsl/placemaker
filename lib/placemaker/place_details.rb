module Placemaker

  # container for one named place mentioned in the document
  class PlaceDetails
    include Placemaker::XmlHelper
    
    # Returns a Placemaker::Location object as a container for place information.
    def place
      Placemaker::Location.new(@nodeset.search('.//xmlns:place'))
    end
    
    # type of match (0=text or text and coordinates, 1=coordinates only) 
    def match_type
      nested_node('matchType').to_i
    end

    # relative weight of the place within the document (range 1-100) 
    def weight
      nested_node('weight').to_i
    end

    # confidence that the document mentions the place (range 1-10) 
    def confidence
      nested_node('confidence').to_i
    end    

  end
end