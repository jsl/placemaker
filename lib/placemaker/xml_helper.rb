module Placemaker
  module XmlHelper
    def initialize(nodeset)
      @nodeset = nodeset
    end
    
    # Returns the inner text of a node with the given name under the current @nodeset 
    def nested_node(name)
      @nodeset.search(".//xmlns:#{name}").inner_text
    end
    
    private :nested_node
  end
end