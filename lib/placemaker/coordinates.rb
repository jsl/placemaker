module Placemaker
  class Coordinates
    include Placemaker::XmlHelper
    
    def lat
      nested_node('latitude').to_f
    end
    
    def lng
      nested_node('longitude').to_f
    end
  end
end
