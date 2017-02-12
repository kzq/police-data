module PoliceDataApi
  class Response
    attr_reader :body, :code, :headers
    
    def initialize(response)
      @body, @code, @headers= response.body, response.code, response.headers
    end
  end
end