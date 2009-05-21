require 'rubygems'
require 'curb'
require 'nokogiri'
require 'cgi'

require File.join(File.dirname(__FILE__), %w[placemaker xml_helper])

lib_dirs =  [ 'core_ext', 'placemaker' ].map do |d|
  File.join(File.dirname(__FILE__), d)
end

lib_dirs.each do |d|
  Dir[File.join(d, "*.rb")].each {|file| require file }
end
