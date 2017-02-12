describe PoliceDataApi do
  before do
    ApiService.url = nil
  end
  
  describe "#url" do
    it "sets the api base url" do
      ApiService.url = 'https://data.police.uk/api/'
      expect(ApiService.url).to eq('https://data.police.uk/api/')
    end
  end
end