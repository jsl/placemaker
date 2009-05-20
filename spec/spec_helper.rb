require 'rubygems'
require 'mocha'
require 'spec'

require File.join(File.dirname(__FILE__), %w[.. lib placemaker])

Spec::Runner.configure do |config|
  config.mock_with(:mocha)
end

shared_examples_for "all backends" do
  it "should respond to #get" do
    @backend.should respond_to(:get)
  end
  
  it "should respond to #set" do
    @backend.should respond_to(:set)
  end  
end
