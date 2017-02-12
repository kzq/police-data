module PoliceDataApi
  class Resource
    attr_accessor :url, :headers
    
    def initialize(endpoint)
      @url, @headers = api_url + endpoint, default_header
    end
    
    def api_url
      'https://data.police.uk/api/'    
    end
    
    def default_header
      {:content_type => 'application/json'}
    end
  end
end