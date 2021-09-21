require 'rails_helper'

RSpec.describe "Api::V1::Participants", type: :request do
  describe "GET /participants" do
    let(:url) { "/api/v1/participants" }
    let!(:participants) { create(:participant) }

    it "returns all Participants" do
      get url
      expect(body_json['participants']).to contain_exactly participants.as_json(only: %i(id name cpf_cnpj fantasy_name person_type client_type))
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

end
