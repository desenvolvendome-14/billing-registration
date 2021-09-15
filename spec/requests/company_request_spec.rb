RSpec.describe 'Companies', type: :request do

  describe 'POST /company' do
    # valid payload
    let(:valid_company_name) { { company_name: 'Walt Disney' } }
    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_company_name }
      it 'creates a company' do
        expect(json['company_name']).to eq('Walt Disney')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end