require 'rest-client'

RSpec.describe 'GET trails from api' do 
  before do
    api_key = Rails.application.credentials.mapquest_api[:api_key]
		response = RestClient.get(`https://www.hikingproject.com/data/get-trails?59.3293&lon=18.0686&maxDistance=1000000&key=#{api_key}`,
      {
        params: {
          # latitude: 59.3293
          # longitude: 18.0686
          api_key: Rails.application.credentials.trail_api[:api_key]
        }
      }
    )
    binding.pry
	end

	describe 'API gives data' do 
		it 'gives a string of trails' do
			expect(response_json).to eq 'trails Tyresta National Park Loop'
		end

		it 'gives status 200' do
			expect(respone.status).to eq 200
		end
  end
end