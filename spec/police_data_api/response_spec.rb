describe PoliceDataApi::Response do
  let(:http_response) {double :response, body: 'body', code: 'code', headers: 'headers'}
  
  subject { PoliceDataApi::Response.new(http_response) }
  
  its(:body) { should eq('body') }
  
  its(:code) {should eq('code') }
  
  its(:headers) {should eq('headers') }
end