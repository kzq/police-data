require 'police_data_api/service'
require 'police_data_api/param_manager'

module PoliceDataApi
  class GeneralError < StandardError; end
  
  class << self
    def street_level_crimes(options)
      param_manager = PoliceDataApi::ParamManager.new({ lat: options[:lat], lng: options[:lng] })
      service_path = "crimes-street/all-crime"
      Service.new.street_level_crimes(param_manager: param_manager, path: service_path)
    end 
  end 
end