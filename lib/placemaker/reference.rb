module Placemaker

  class Reference
    include Placemaker::XmlHelper

    def to_s
      puts @nodeset.to_xml
    end
  end
end
