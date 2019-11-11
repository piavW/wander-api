RSpec.describe 'Consume API' do 
	# Before do
		
	# end

	describe 'API gives data' do 
		it 'gives a string of trails' do
			
			expect(response_json).to eq 'Trail information'
		end

		it 'gives status 200' do
			expect(respone.status).to eq 200
		end
  end
end