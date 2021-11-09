# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/address/", type: :request do
  let(:address) { create(:address) }
  let(:valid_attributes) { build(:address).attributes }

  let(:invalid_attributes) do
    { zip_code: "",
      state: "",
      city: "",
      district: "",
      street: "",
      house_number: "",
      complement: "",
      participant_id: ""
    }
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      Address.create! valid_attributes
      get api_v1_addresses_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_address_url(address), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before { post  api_v1_addresses_url, as: :json, params: { address: valid_attributes } }

    context "with valid parameters" do
      it "creates a new addresss" do
        expect(body_json["zip_code"]).to eq("16260000")
        expect(body_json["state"]).to eq("SP")
        expect(body_json["city"]).to eq("Coroados")
        expect(body_json["district"]).to eq("Gentil Bernardes")
        expect(body_json["street"]).to eq("Rua Maestro Antônio Guerra")
        expect(body_json["house_number"]).to eq("39")
        expect(body_json["complement"]).to eq("casa")
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address" do
        expect do
          post api_v1_addresses_url,
               params: { address: invalid_attributes }, as: :json
        end.to change(Address.where(district: :district), :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          zip_code: "16200203", state: "SP", city: "Birigui", district: "Vila Angélica",
          street: "Avenida São Francisco", house_number: "156", complement: "casa"
        }
      end

      it "updates the requested charts_account" do
        address = Address.create! valid_attributes
        patch api_v1_address_url(address),
              params: { address: new_attributes }, as: :json
        address.reload
        expect(address.zip_code).to eq("16200203")
        expect(address.state).to eq("SP")
        expect(address.city).to eq("Birigui")
        expect(address.district).to eq("Vila Angélica")
        expect(address.street).to eq("Avenida São Francisco")
        expect(address.house_number).to eq("156")
        expect(address.complement).to eq("casa")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the address" do
        patch api_v1_address_url(address),
              params: { address: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested address" do
      expect do
        delete api_v1_address_url(address), headers: valid_headers, as: :json
      end.to change(Address, :count).by(0)
    end
  end

end
