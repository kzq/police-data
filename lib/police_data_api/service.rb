require 'rest-client'
require 'json'

require 'police_data_api/request'
require 'police_data_api/resource'
require 'police_data_api/response'

module PoliceDataApi
  class Service
    def street_level_crimes(options)
      param_manager = options[:param_manager]
      param_manager.validate([:lat, :lng])
      values, resource = param_manager.params, Resource.new(options[:path]) 
      request = Request.new(10)
      response = Response.new(request.send(resource,values))
    end
  end
end
