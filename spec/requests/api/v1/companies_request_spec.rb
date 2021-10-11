require 'rails_helper'

RSpec.describe 'Api::V1::Companies', type: :request do

  let!(:companies) { create_list(:company, 5) }

  describe 'POST /api/v1/companies' do
    # valid company
    let(:valid_params) { { company_name: 'Walt Disney', state_registration: '192389988',
                                 cnpj: '11.111.111/0001-01', fantasy_name: 'Walt Disney', business_phone: '88 8888-8888'} }

    context 'when the request is valid' do
      before { post '/api/v1/companies', params: valid_params }

      it 'creates a company' do
        expect(body_json["company"]["company_name"]).to eq('Walt Disney')
        expect(body_json["company"]["state_registration"]).to eq('192389988')
        expect(body_json["company"]["cnpj"]).to eq('11.111.111/0001-01')
        expect(body_json["company"]["fantasy_name"]).to eq('Walt Disney')
        expect(body_json["company"]["business_phone"]).to eq('88 8888-8888')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /api/v1/companies' do
    context 'with no filters' do
      before { get '/api/v1/companies' }

      it 'returns companies' do
        expect(body_json["companies"]).not_to be_empty
        expect(body_json["companies"].size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with filters' do
      let!(:company) { create(:company, company_name: "teste", cnpj: "11.111.111/0001-11", fantasy_name: "teste fantasia") }

      before { get "/api/v1/companies?company_name=#{company.company_name}&cnpj=#{company.cnpj}&fantasy_name=#{company.fantasy_name}" }

      it 'returns filtered companies' do

        expect(body_json["companies"]).not_to be_empty
        expect(body_json["companies"].size).to eq(1)
      end
    end
  end
end