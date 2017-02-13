module PoliceDataApi
  class Request
    def initialize(timeout)
      @timeout = timeout 
    end
    
    def send(resource, values)
      begin
        RestClient.get resource.url, params: values
      rescue => e
        response = e.response
        handle_status_code(response.code,response.body)
      end  
    end
    
    def handle_status_code(code, body)
      case code
      when 200, 202
        return
      when 400
        raise GeneralError, "Bad request: #{body}"
      when 401
        raise GeneralError, body
      when 404
        raise GeneralError, "404 Not found"
      else
        raise GeneralError, "Unknown error (status code #{code}): #{body}"
      end
    end
  end
end  