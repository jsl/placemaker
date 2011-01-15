require 'rubygems'
require 'spec'

require 'placemaker'

shared_examples_for "all backends" do
  it "should respond to #get" do
    @backend.should respond_to(:get)
  end
  
  it "should respond to #set" do
    @backend.should respond_to(:set)
  end  
end
