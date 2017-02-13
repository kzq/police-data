module PoliceDataApi
  class ParamManager
    attr_accessor :params
    
    def initialize(options) 
      # only accepts list of params in hasg format
      @params = options
      is_hash?
    end
    
    def validate(must_have_params_array)
      # raise error if mandatory params are not given
      must_have_params_array.each {|e| raise PoliceDataApi::GeneralError, "Please provide #{e}" if @params[e].nil? }
    end
    
    def is_hash?
      raise ArgumentError, 'Service only accepts params in hash format' unless @params.is_a?(Hash)  
    end
  end
end  