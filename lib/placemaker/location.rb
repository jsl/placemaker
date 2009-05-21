module Placemaker

  # Parses and contains data for +place+, +administrative scope+ and +geographic scope+ elements.
  class Location
    include Placemaker::XmlHelper
    
    # permanent identifier for the place
    def woe_id
      nested_node('woeId').to_i
    end

    # fully qualified name for the place
    def name
      nested_node('name')
    end
    
    # place type name for the place
    def location_type
      nested_node('type')
    end
    
    # centroid for the place
    def centroid
      Placemaker::Coordinates.new(@nodeset.search('.//xmlns:centroid', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema'))
    end

    private    
    
    def nested_node(name)
      @nodeset.search(".//xmlns:#{name}", 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text
    end    
  end
end