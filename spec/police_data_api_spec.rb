describe PoliceDataApi do
  let(:service) { double :service }
  
  describe "#service" do
    it "returns service" do
      expect(PoliceDataApi::Service).to receive(:new).and_return(service)
      expect(PoliceDataApi.service).to eq(service)
    end
  end
end