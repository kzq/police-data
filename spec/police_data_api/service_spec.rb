describe PoliceDataApi::Service do
  let(:service) { PoliceDataApi::Service.new }
  
  let(:options) do 
    { lat: 51.5501741, lng: -0.003371000000015556 }
  end  
  
  describe "#street_level_crimes" do
    context "Wrong arguments" do
      it "raises argument error" do
        expect{service.street_level_crimes(2)}.to raise_error(ArgumentError)
      end
      
      it "raises an error if lat not given" do
        options[:lat] = nil
        expect{service.street_level_crimes(options)}.to raise_error(PoliceDataApi::GeneralError)
      end
      
      it "raises an error if lng not given" do
        options[:lng] = nil
        expect{service.street_level_crimes(options)}.to raise_error(PoliceDataApi::GeneralError)
      end
    end
    
    it "makes request with latitude and longitude" do
      #resource = double("Resource")
      #request = double("Request")
      #response = double("Response")
      #expect(resource).to receive(:new).with("crimes-street/all-crime").and_return(resource)
      #expect(request).to receive(:new).with(10).and_return(request)
      #expect(request).to receive(:send).with(resource, options).and_return({'total'=> 330})
      #expect(response).to receive(:new).with(request.send(resource,options)).and_return({})
      #res = resource.new("crimes-street/all-crime")
      stub = stub_request(:get, 'https://data.police.uk/api/crimes-street/all-crime?lat=51.5501741&lng=-0.003371000000015556')
      service.street_level_crimes(options)
      expect(stub).to have_been_requested
    end
  
  end 
end