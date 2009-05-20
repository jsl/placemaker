module Placemaker
  class Document
    def initialize(nodeset)
      @nodeset = nodeset
    end
    
    def places
      @nodeset.search('.//xmlns:placeDetails', 'xmlns' => 'http://wherein.yahooapis.com/v1/schema').map do |p|
        Placemaker::Place.new(p)
      end
    end
    
  end
end