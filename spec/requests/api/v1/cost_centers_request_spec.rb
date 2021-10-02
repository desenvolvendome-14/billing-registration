require 'rails_helper'

RSpec.describe 'Api::V1::CostCenters', type: :request do

  describe 'POST /api/v1/cost_centers' do
    # valid cost center
    let(:valid_params) { { description: 'This is a cost center'} }

    context 'when the request is valid' do
      before { post '/api/v1/cost_centers', params: valid_params }

      it 'creates a cost center' do
        expect(body_json["cost_center"]["description"]).to eq('This is a cost center')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /api/v1/cost_centers' do
    context 'with no filters' do
      before { get '/api/v1/cost_centers' }

      it 'returns cost_centers' do
        expect(body_json["cost_centers"]).not_to be_empty
        expect(body_json["cost_centers"].size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
end