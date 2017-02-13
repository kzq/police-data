describe PoliceDataService do
  let(:data) {[{'category'=> 'anti-social-behaviour', 'persistent_id'=> '', 'location_type'=> 'Force', 'location_subtype'=> '','id'=> 20599642,'location'=> {'latitude'=> '52.6269479','longitude'=> '-1.1121716'}},{'category'=> 'burglary','persistent_id'=> 'aebd220e869a235ba92cde43f7e0df29001573b3df1b094bb952820b2b8f44b0','location_type'=> 'Force','location_subtype'=> '','id'=> 20604632,'location'=> {'latitude'=> '52.6271606','longitude'=> -1.1485111}}].to_json}
  let(:police_data_service) {described_class.new}
  
  describe "#street_level_crimes_data" do
    it "performs calcultions on given data and return statistics" do
      stats_extracted_from_data = [{:total=>2,:statistics=>[{:category=>"burglary", :total=>1},{:category=>"anti-social-behaviour", :total=>1}]}]
      expect(police_data_service.street_level_crimes_data(data)).to eq(stats_extracted_from_data)   
    end
  end
  
  describe "#to_hash" do
    it "converts given json to a hash" do
      expect(police_data_service.to_hash(data)).to be_a(Array || Hash) 
    end
  end
  
end