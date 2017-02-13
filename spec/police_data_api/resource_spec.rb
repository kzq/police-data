describe PoliceDataApi::Resource do
  subject { PoliceDataApi::Resource.new("path/to/resource") }
  
  its(:api_url) { should eq('https://data.police.uk/api/') }
  
  its(:default_header) {should eq({:content_type => 'application/json'}) }
  
  its(:url) {should eq('https://data.police.uk/api/path/to/resource') }
end