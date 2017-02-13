require 'rest-client'
require 'json'

require 'police_data_api/request'
require 'police_data_api/resource'
require 'police_data_api/response'

module PoliceDataApi
  class Service
    def street_level_crimes(options)
      raise ArgumentError, 'Street Level Crimes service expect a hash' unless options.is_a?(Hash)
      raise PoliceDataApi::GeneralError, 'Please provide latitude' if options[:lat].nil?
      raise PoliceDataApi::GeneralError, 'Please provide longitude' if options[:lng].nil?
      values, resource = {lat: options[:lat], lng: options[:lng]}, Resource.new("crimes-street/all-crime") 
      request = Request.new(10)
      response = Response.new(request.send(resource,values))
    end
  end  
end
