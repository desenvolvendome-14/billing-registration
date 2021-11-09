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


end
