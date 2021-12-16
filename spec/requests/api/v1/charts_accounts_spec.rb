# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/charts_accounts/", type: :request do
  let(:charts_account) { create(:charts_account) }
  let(:valid_attributes) { build(:charts_account).attributes }

  let(:invalid_attributes) do
    { description: "",
      internal_code: 0 }
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      ChartsAccount.create! valid_attributes
      get api_v1_charts_accounts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    context "with filters" do
      let(:charts_account) { create(:charts_account, description: "teste", internal_code: 1) }

      before { get "/api/v1/charts_accounts?description=#{charts_account.description}" }

      it "returns filtered cost centers" do
        expect(charts_account.description).to eq("teste")
        expect(charts_account.internal_code.to_s).to eq("1")
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_charts_account_url(charts_account), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before { post  api_v1_charts_accounts_url, as: :json, params: valid_attributes }

    context "with valid parameters" do
      it "creates a new charts account" do
        expect(body_json["description"]).to eq("Matéria-Prima")
        expect(body_json["internal_code"].to_i).to eq(99)
      end
    end

    context "with invalid parameters" do
      it "does not create a new ChartsAccount" do
        expect do
          post api_v1_charts_accounts_url,
               params: { charts_account: invalid_attributes }, as: :json
        end.to change(ChartsAccount.where(description: :description), :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          description: "Luciano 2", internal_code: 1000
        }
      end

      it "updates the requested charts_account" do
        charts_account = ChartsAccount.create! valid_attributes
        patch api_v1_charts_account_url(charts_account),
              params: new_attributes, as: :json
        charts_account.reload
        expect(charts_account.description).to eq("Luciano 2")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the charts_account" do
        # charts_account = ChartsAccount.create! valid_attributes
        patch api_v1_charts_account_url(charts_account),
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested charts_account" do
      expect do
        delete api_v1_charts_account_url(charts_account), headers: valid_headers, as: :json
      end.to change(ChartsAccount, :count).by(0)
    end
  end
end
