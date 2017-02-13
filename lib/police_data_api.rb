require 'forwardable'
require 'police_data_api/service'

module PoliceDataApi
  class GeneralError < StandardError; end
  
  class << self
    extend Forwardable
    
    def_delegators :service , :street_level_crimes
    
    def service
      @service ||= Service.new
    end
    
  end 
end