RSpec.describe 'Api::V1::Companies', type: :request do

  describe 'POST /api/v1/company' do
    # valid payload
    let(:valid_company_name) { { company_name: 'Walt Disney', state_registration: '192389988',
                                 cnpj: '11.111.111/0001-01', fantasy_name: 'Walt Disney', business_phone: '88 8888-8888'} }
    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_company_name }
      it 'creates a company' do
        expect(body_json['company_name']).to eq('Walt Disney')
        expect(body_json['state_registration']).to eq('192389988')
        expect(body_json['cnpj']).to eq('11.111.111/0001-01')
        expect(body_json['fantasy_name']).to eq('Walt Disney')
        expect(body_json['business_phone']).to eq('88 8888-8888')
      end
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end