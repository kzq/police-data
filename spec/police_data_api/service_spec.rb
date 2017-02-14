describe PoliceDataApi::Service do
  let(:service) { PoliceDataApi::Service.new }
  
  let(:options) do 
    {param_manager: PoliceDataApi::ParamManager.new({ lat: 51.5501741, lng: -0.003371000000015556 }), path: "crimes-street/all-crime"}
  end  
  
  describe "#street_level_crimes" do
    it "makes request with latitude and longitude" do
      param_manager = double("ParamManager", validate: [])
      resource = double("Resource")
      allow(resource).to receive(:new).with("crimes-street/all-crime").and_return(resource)
      request = double("Request", new: request)
      response = double("Response", new: response)
      stub = stub_request(:get, 'https://data.police.uk/api/crimes-street/all-crime?lat=51.5501741&lng=-0.003371000000015556')
      data = service.street_level_crimes(options)
      expect(stub).to have_been_requested
    end
  
  end 
end