module Placemaker
  class Coordinates
    include Placemaker::XmlHelper
    
    def lat
      @nodeset.search('.//xmlns:latitude', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_f
    end
    
    def lng
      @nodeset.search('.//xmlns:longitude', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').inner_text.to_f
    end
  end
end
