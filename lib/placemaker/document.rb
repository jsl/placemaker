require 'placemaker/xml_helper'
require 'placemaker/place_details'
require 'placemaker/location'
require 'placemaker/extents'
require 'placemaker/reference'

module Placemaker
  
  class Document
    include Placemaker::XmlHelper
    
    # Returns a Placemaker::Location object that is a container for one named place mentioned in the document 
    def place_details
      @nodeset.search('.//xmlns:placeDetails').map do |p|
        Placemaker::PlaceDetails.new(p)
      end
    end
    
    # Returns a Placemaker::Location object that is a container for the smallest administrative place that best describes the document 
    def administrative_scope
      as = @nodeset.search('.//xmlns:administrativeScope').first
      Placemaker::Location.new(as) unless as.nil?
    end
    
    # Returns a Placemaker::Location object that is a container for the smallest place that best describes the document 
    def geographic_scope
      gs = @nodeset.search('.//xmlns:geographicScope').first
      Placemaker::Location.new(gs) unless gs.nil?
    end
    
    # Returns a Placemaker::Extents object that is a container for the the map extents covering the places mentioned in the document 
    def extents
      extents = @nodeset.search('.//xmlns:extents').first
      Placemaker::Extents.new(extents) unless extents.nil?
    end

    def reference_list
      @nodeset.search('.//xmlns:referenceList[1]/xmlns:reference').map do |reference|
        Placemaker::Reference.new(reference)
      end
    end
  end
  
end