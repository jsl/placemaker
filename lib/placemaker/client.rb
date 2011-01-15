require 'placemaker/xml_parser'

module Placemaker
  
  # Main interface to the Placemaker API.
  class Client
    POST_FIELDS =  %w[ appid document_content document_url document_type document_title 
      auto_disambiguate focus_woe_id input_language output_type ].map{|f| f.to_sym}

    def initialize(options = {})
      @options = options
      @options[:appid] ||= ENV['PLACEMAKER_APPID']
      
      @xml_parser = Placemaker::XmlParser.new('NODOC')
      
      verify_content_set
      verify_document_type_set
    end

    # Fetches the place information for input parameters from the Yahoo Placemaker service
    def fetch!
      fields = POST_FIELDS.reject{|f| @options[f].nil? }.map do |f|
        # Change ruby-form fields to url type, e.g., document_content => documentContent
        cgi_param = f.to_s.gsub(/\_(.)/) {|s| s.upcase}.gsub('_', '').sub(/url/i, 'URL')
        Curl::PostField.content(cgi_param, @options[f])
      end

      res         = Curl::Easy.http_post('http://wherein.yahooapis.com/v1/document', *fields)
      @xml_parser = Placemaker::XmlParser.new(res.body_str)
    end

    # Returns a collection of Placemaker::Document items as containers for content location information
    def documents
      @xml_parser.documents
    end
    
    # time in seconds to process the document
    def processing_time
      @xml_parser.processing_time
    end
    
    # version of the software used to process the document 
    def version
      @xml_parser.version
    end

    # length in bytes of the document
    def document_length
      @xml_parser.document_length
    end
    
    # Create convenience methods to access post fields from the @options hash, mostly for testing.
    POST_FIELDS.each do |f|
      define_method(f) do  # def appid
        @options[f]        #   @options[:appid]
      end                  # end
    end

    private

    def verify_document_type_set
      valid_types = %w[
        text/plain
        text/html text/xml text/rss 
        application/xml application/rss+xml
      ]

      raise ArgumentError, "Document type must be in #{valid_types.join(', ')}" unless valid_types.include?(@options[:document_type]) 
    end

    def verify_content_set 
      raise ArgumentError, "Either document_url or document_content must be set" if (@options[:document_content].nil? && @options[:document_url].nil?)
    end
  end
end