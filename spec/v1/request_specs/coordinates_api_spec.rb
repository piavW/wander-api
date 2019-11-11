require 'rest-client'

RSpec.describe 'GET Latitde and Longitude from a search' do 
  
  before do
    api_key = Rails.application.credentials.mapquest_api[:api_key]
    response = RestClient.get(`http://www.mapquestapi.com/geocoding/v1/address?key=#{api_key}&location=Washington,DC`, 
      params: {
      api_key: Rails.application.credentials.mapquest_api[:api_key]
    })
    binding.pry
	end

	describe 'API gives data' do 
		it 'gives a string of trails' do
			expect(response_json).to eq '38.9072, 77.0369'
		end

		it 'gives status 200' do
			expect(respone.status).to eq 200
		end
  end
end
