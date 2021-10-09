require 'rails_helper'

RSpec.describe "Api::V1::Banks", type: :request do
  describe "GET /banks" do
    let(:url) { "/api/v1/banks" }
    let!(:banks) { create(:bank) }

    it "returns all Banks" do
      get url
      expect(body_json['banks']).to contain_exactly banks.as_json(only: %i(id code description created_at updated_at address_id))
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /api/v1/banks" do
    # valid bank
    let(:valid_params) { { code: 260, description: 'Nu Payments' } }

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

  describe "DELETE /banks" do
    let(:url) { "/api/v1/banks/#{bank.id}" }
    let!(:bank) { create(:bank) }

    it 'removes Bank' do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(Bank, :count).by(-1)
    end

    it 'returns success status' do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
