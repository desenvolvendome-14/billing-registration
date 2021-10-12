require 'rails_helper'

RSpec.describe 'Api::V1::ChargeTypes', type: :request do

  let!(:charge_types) { create_list(:charge_type, 5) }

  describe 'POST /api/v1/charge_types' do
    # valid charge type
    let(:valid_params) { { description: 'This is a charge type'} }

    context 'when the request is valid' do
      before { post '/api/v1/charge_types', params: valid_params }

      it 'creates a charge type' do
        expect(body_json["charge_type"]["description"]).to eq('This is a charge type')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /api/v1/charge_types' do
    context 'with no filters' do
      before { get '/api/v1/charge_types' }

      it 'returns charge_types' do
        expect(body_json["charge_types"]).not_to be_empty
        expect(body_json["charge_types"].size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with filters' do
      let!(:charge_type) { create(:charge_type, description: "teste" )}

      before { get "/api/v1/charge_types?description=#{charge_type.description}" }

      it 'returns filtered charge types' do

        expect(body_json["charge_types"]).not_to be_empty
        expect(body_json["charge_types"].size).to eq(1)
      end
    end
  end
end