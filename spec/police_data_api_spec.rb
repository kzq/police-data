describe PoliceDataApi do
  let(:options) { { lat: 123, lng: 456 } }
  
  describe "#street_level_crimes" do
    it "returns data with street level crimes" do
      service_path = "crimes-street/all-crime"
      param_manager = double("ParamManager", validate: [])
      service = double("Service", new: service)
      allow(service).to receive(:street_level_crimes).with(param_manager: param_manager, path: service_path).and_return('data')
      data = service.street_level_crimes(param_manager: param_manager, path: service_path)
      expect(data).to eq('data')
    end
  end
end