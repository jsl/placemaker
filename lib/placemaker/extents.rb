require 'placemaker/coordinates'

module Placemaker
  
  # container for the the map extents covering the places mentioned in the document 
  class Extents
    include Placemaker::XmlHelper
            
    # coordinates of center (WGS84)
    def center
      Placemaker::Coordinates.new(@nodeset.search('.//xmlns:center'))
    end
    
    # coordinates of southwest corner of bounding box (WGS84)
    def south_west
      Placemaker::Coordinates.new(@nodeset.search('.//xmlns:southWest'))
    end
    
    # coordinates of northeast corner of bounding box (WGS84)
    def north_east
      Placemaker::Coordinates.new(@nodeset.search('.//xmlns:northEast'))
    end
  end

end