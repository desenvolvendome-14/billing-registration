require "rails_helper"

RSpec.describe "Api::V1::Participants", type: :request do
  describe "GET /participants" do
    let(:url) { "/api/v1/participants" }
    let!(:participants) { create(:participant, :with_address) }

    it "returns all Participants" do
      get url
      expect(body_json["participants"]).to contain_exactly participants.as_json(only: %i[id name cpf_cnpj fantasy_name
                                                                                         person_type client_type])
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end

    context "with filters" do
      let!(:participant) { create(:participant) }

      before { get "/api/v1/participants?name=#{participant.name}" }

      it "returns filtered participant" do
        expect(body_json["participants"]).not_to be_empty
        expect(body_json["participants"].size).to eq(2)
      end
    end
  end

  describe "POST /participants" do
    let(:url) { "/api/v1/participants" }
    let(:participant_params) { attributes_for(:participant) }

    before { create(:participant) }

    it "adds a new Participant" do
      expect do
        post url, headers: headers, params: { participant: participant_params }
      end.to change(Participant, :count).by(1)
    end

    it "returns success status" do
      headers = { "ACCEPT" => "application/json" }
      post url, headers: headers, params: { participant: participant_params }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /participants/:id " do
    let(:url) { "/api/v1/participants/#{participant.id}" }
    let!(:participant) { create(:participant) }
    let(:new_name) { "Goku" }
    let(:participant_params) { { participant: { name: new_name } }.to_json }

    it "returns success status" do
      patch url, headers: headers, params: participant_params
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /participants" do
    let(:url) { "/api/v1/participants/#{participant.id}" }
    let!(:participant) { create(:participant) }

    it "removes Participant" do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(Participant, :count).by(-1)
    end

    it "returns success status" do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
