require 'rest-client'
require 'json'

require 'police_data_api/request'
require 'police_data_api/resource'
require 'police_data_api/response'

module PoliceDataApi
  class Service
    def street_level_crimes(options={})
      values, resource = {lat: options[:lat], lng: options[:lng]}, Resource.new("crimes-street/all-crime") 
      request = Request.new(10)
      response = Response.new(request.send(resource,values))
    end
  end  
end
