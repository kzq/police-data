$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'forwardable'
require 'police_data_api/service'

module PoliceDataApi
  class Error < RuntimeError; end
  
  class << self
    extend Forwardable
    
    def_delegators :service , :street_level_crimes
    
    def service
      @service ||= PoliceDataApi::Service.new
    end
    
  end 
end