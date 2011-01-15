require 'spec_helper'

describe Placemaker::Client do
  before do
    @valid_opts = {
      :document_url   => 'http://www.example.com',
      :document_type  => 'text/plain'
    }
  end
  
  describe "object initialization" do
    it "should set appid to the value of ENV['PLACEMAKER_APPID']" do
      ENV['PLACEMAKER_APPID'] = 'foo'
      p = Placemaker::Client.new(@valid_opts)
      p.appid.should == 'foo'
    end
    
    it "should initialize #documents to an empty array" do
      p = Placemaker::Client.new(@valid_opts)
      p.documents.should be_a(Array)
      p.documents.should be_empty
    end
  
    it "should raise an argument error if the document_type is not correctly set" do
      @valid_opts.delete(:document_type)
      lambda {
        Placemaker::Client.new(@valid_opts)
      }.should raise_error(ArgumentError)
    end
  
    it "should set the appid to the value of options[:appid] if provided" do
      ENV['PLACEMAKER_APPID'] = 'foo'
      p = Placemaker::Client.new(@valid_opts.merge(:appid => 'fark', :document_url => 'foo'))
      p.appid.should == 'fark'  
    end
  
    it "should create methods to allow access to configuration parameters" do
      p = Placemaker::Client.new(@valid_opts.merge(:document_content => 'foo'))
      p.document_content.should == 'foo'
    end
  
    it "should raise an error if both document_content and document_url are nil" do
      lambda {
        p = Placemaker::Client.new
      }.should raise_error(ArgumentError)
    end
  end
end