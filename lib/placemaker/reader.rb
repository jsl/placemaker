module Placemaker
  class Reader
    POST_FIELDS =  %w[ appid document_content document_url document_type document_title 
      auto_disambiguate focus_woe_id input_language output_type ].map{|f| f.to_sym}

    attr_reader :documents

    def initialize(options = {})
      @options = options
      @options[:appid] ||= ENV['PLACEMAKER_APPID']
      @documents = [ ]
      verify_content_set
      verify_document_type_set
    end

    POST_FIELDS.each do |f|
      define_method(f) do  # def appid
        @options[f]        #   @options[:appid]
      end                  # end
    end

    def fetch
      fields = POST_FIELDS.reject{|f| @options[f].nil? }.map do |f|
        # Change ruby-form fields to url type, e.g., document_content => documentContent
        cgi_param = f.to_s.gsub(/\_(.)/) {|s| s.upcase}.gsub('_', '').sub(/url/i, 'URL')
        Curl::PostField.content(cgi_param, @options[f])
      end

      res = Curl::Easy.http_post('http://wherein.yahooapis.com/v1/document', *fields)
      xml_parser = Placemaker::XmlParser.new(res.body_str)
      @documents = xml_parser.documents
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