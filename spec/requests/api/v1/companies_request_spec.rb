require 'rails_helper'

RSpec.describe 'Api::V1::Companies', type: :request do

  describe 'POST /api/v1/companies' do
    # valid company
    let(:valid_params) { { company_name: 'Walt Disney', state_registration: '192389988',
                                 cnpj: '11.111.111/0001-01', fantasy_name: 'Walt Disney', business_phone: '88 8888-8888'} }

    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_params }

      it 'creates a company' do
        expect(json["company"]["company_name"]).to eq('Walt Disney')
        expect(json["company"]["state_registration"]).to eq('192389988')
        expect(json["company"]["cnpj"]).to eq('11.111.111/0001-01')
        expect(json["company"]["fantasy_name"]).to eq('Walt Disney')
        expect(json["company"]["business_phone"]).to eq('88 8888-8888')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end