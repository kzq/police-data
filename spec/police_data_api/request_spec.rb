describe PoliceDataApi::Request do
  subject(:request) { described_class.new(10) }
  
  let(:resource) {double :resource, url: 'https://data.police.uk/api/crimes-street/all-crime'}
  let(:values) { {lat: 51.5501741, lng: -0.003371000000015556} }
  
  describe "#send" do
    context "success response received" do
      it "makes a get request with parameters" do
        stub = stub_request(:get, 'https://data.police.uk/api/crimes-street/all-crime?lat=51.5501741&lng=-0.003371000000015556') 
        response = request.send(resource, values)
        expect(stub).to have_been_requested
        expect(response.code).to eq(200)
      end
    end 
  end 
  
  describe "#handle_status_code" do
    it "sends error messages when resource is not found" do
      expect(request.handle_status_code(200,'body')).to be(nil)
      expect{ request.handle_status_code(400,'body') }.to raise_error(PoliceDataApi::GeneralError)
      expect{ request.handle_status_code(401,'body') }.to raise_error(PoliceDataApi::GeneralError)
      expect{ request.handle_status_code(404,'body') }.to raise_error(PoliceDataApi::GeneralError)
      expect{ request.handle_status_code(999,'body') }.to raise_error(PoliceDataApi::GeneralError)     
    end
  end 
end