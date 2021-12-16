# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/bank_accounts/", type: :request do
  let(:bank) { create(:bank) }
  let(:bank_account) { create(:bank_account, bank_id: bank.id) }
  let(:valid_attributes) { build(:bank_account, bank_id: bank.id).attributes }

  let(:invalid_attributes) do
    { description: "",
      city: "",
      agency: "",
      agency_digit: "",
      account: "",
      account_digit: "",
      assignor: "" }
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      BankAccount.create! valid_attributes
      get api_v1_bank_accounts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    context "with filters" do
      let(:bank_account_description) do
        create(:bank_account, description: "teste", city: "Birigui", agency: "001", account: "999", assignor: "7777",
                              bank_id: bank.id)
      end
      let(:bank_account_city) do
        create(:bank_account, description: "teste", city: "Coroados", agency: "001", account: "999", assignor: "7777",
                              bank_id: bank.id)
      end
      let(:bank_account_agency) do
        create(:bank_account, description: "teste", city: "Birigui", agency: "012", account: "999", assignor: "7777",
                              bank_id: bank.id)
      end
      let(:bank_account_account) do
        create(:bank_account, description: "teste", city: "Birigui", agency: "001", account: "777", assignor: "7777",
                              bank_id: bank.id)
      end
      let(:bank_account_assignor) do
        create(:bank_account, description: "teste", city: "Birigui", agency: "001", account: "999", assignor: "5555",
                              bank_id: bank.id)
      end

      it "returns filtered bank account by description" do
        get "/api/v1/bank_accounts?description=#{bank_account_description.description}"
        expect(bank_account_description.description).to eq("teste")
      end

      it "returns filtered bank account by city" do
        get "/api/v1/bank_accounts?city=#{bank_account_city.city}"
        expect(bank_account_city.city).to eq("Coroados")
      end

      it "returns filtered bank account by agency" do
        get "/api/v1/bank_accounts?city=#{bank_account_agency.agency}"
        expect(bank_account_agency.agency).to eq("012")
      end

      it "returns filtered bank account by account" do
        get "/api/v1/bank_accounts?city=#{bank_account_account.account}"
        expect(bank_account_account.account).to eq("777")
      end

      it "returns filtered bank account by assignor" do
        get "/api/v1/bank_accounts?city=#{bank_account_assignor.account}"
        expect(bank_account_assignor.assignor).to eq("5555")
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_bank_account_url(bank_account), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    before { post  api_v1_bank_accounts_url, as: :json, params: { bank_account: valid_attributes } }

    context "with valid parameters" do
      it "creates a new bank account" do
        expect(body_json["description"]).to eq("conta corrente")
      end
    end

    context "with invalid parameters" do
      it "does not create a new BankAccount" do
        expect do
          post api_v1_bank_accounts_url,
               params: { bank_account: invalid_attributes }, as: :json
        end.to change(BankAccount.where(description: :description), :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:bank_account) { BankAccount.create! valid_attributes }
      let(:new_attributes) do
        {
          description: "Conta Salário"
        }
      end

      it "updates the requested BankAccount" do
        patch api_v1_bank_account_url(bank_account),
              params: { bank_account: new_attributes }, as: :json
        bank_account.reload
        expect(bank_account.description).to eq("Conta Salário")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the BankAccount" do
        patch api_v1_bank_account_url(bank_account),
              params: { bank_account: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested BankAccount" do
      expect do
        delete api_v1_bank_account_url(bank_account), headers: valid_headers, as: :json
      end.to change(BankAccount, :count).by(0)
    end
  end
end
