require 'rubygems'
require 'curb'
require 'nokogiri'
require 'cgi'

dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require 'placemaker/client'