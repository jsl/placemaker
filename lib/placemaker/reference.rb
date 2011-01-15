module Placemaker

  class Reference
    include Placemaker::XmlHelper

    def woe_ids
      nested_node('woeIds')
    end

    def start
      nested_node('start')
    end

    def end
      nested_node('end')
    end

    def is_plain_text_marker
      nested_node('isPlainTextMarker')
    end

    def text
      nested_node('text')
    end

    def type
      nested_node('type')
    end

    def xpath
      nested_node('xpath')
    end
  end
end
