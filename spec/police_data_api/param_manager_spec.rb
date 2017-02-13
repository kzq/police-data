describe PoliceDataApi::ParamManager do
  let(:param_manager) { described_class.new({lat: 123, lng: 456}) }
  
  describe "#initialize" do
    it "does not instantiate if params are not in hash format" do
      expect { PoliceDataApi::ParamManager.new([1,2,3]) }.to raise_error(ArgumentError)  
    end
  end  
  
  describe "#validate" do
    context "Must have params are not present" do
      it "raises error" do
        expect{ param_manager.validate([:unknown]) }.to raise_error(PoliceDataApi::GeneralError)
      end
    end    
  end
end