require 'rails_helper'

RSpec.describe "Api::V1::Banks", type: :request do
  describe "GET /api/v1/banks" do
    # valid bank
    let(:valid_params) { { code: '260', description: 'Nu Payments' } }

    context 'when the request is valid' do
      before { post '/api/v1/banks', params: valid_params }

      it 'create a bank' do
        expect(body_json['code']).to eq(260)
        expect(body_json['description']).to eq('Nu Payments')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
