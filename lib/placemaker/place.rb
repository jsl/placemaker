module Placemaker
  class Point < OpenStruct
  end
  
  class Place
    def initialize(nodeset)
      @nodeset = nodeset
    end
    
    def centroid
      centroid = @nodeset.search('.//xmlns:centroid', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema')
      lat = centroid.search('.//xmlns:latitude', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_f
      lng = centroid.search('.//xmlns:longitude', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_f
      Placemaker::Point.new(:lat => lat, :lng => lng)
    end

    def place_type
      nested_node('type')
    end

    def match_type
      nested_node('matchType').to_i
    end

    def weight
      nested_node('weight').to_i
    end

    def confidence
      nested_node('confidence').to_i
    end
    
    def name
      nested_node('name')
    end
    
    def woe_id
      nested_node('woeId').to_i
    end
    
    private
    
    def nested_node(name)
      @nodeset.search(".//xmlns:#{name}", 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text
    end
  end
end