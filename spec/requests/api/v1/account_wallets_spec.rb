require "rails_helper"

RSpec.describe "Api::V1::AccountWallets", type: :request do
  describe "GET /account_wallets" do
    before do
      create_list(:account_wallet, 5)
      get "/api/v1/account_wallets"
    end

    it "returns account_wallets" do
      expect(body_json["account_wallets"]).not_to be_empty
    end

    it "Check size wallets" do
      expect(body_json["account_wallets"].size).to eq(5)
    end

    it "returns success status" do
      expect(response).to have_http_status(:ok)
    end

    context "when returns account_wallets with filters" do
      let(:account_wallet) { create(:account_wallet, description: "RG") }

      before { get "/api/v1/account_wallets?description=#{account_wallet.description}" }

      it "returns filtered Account wallet" do
        expect(account_wallet.description).to eq("RG")
      end
    end
  end

  describe "POST /api/v1/account_wallets" do
    # valid account wallet
    let(:valid_params) { { description: "SR" } }

    context "when the request is valid" do
      before { post "/api/v1/account_wallets", params: valid_params }

      it "create a Account Wallet" do
        expect(body_json["account_wallet"]["description"]).to eq("SR")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe "DELETE /account_wallets" do
    let(:url) { "/api/v1/account_wallets/#{account_wallet.id}" }
    let!(:account_wallet) { create(:account_wallet) }

    it "removes Account Wallet" do
      headers = { "ACCEPT" => "application/json" }

      expect do
        delete url, headers: headers
      end.to change(AccountWallet, :count).by(-1)
    end

    it "returns success status" do
      headers = { "ACCEPT" => "application/json" }

      delete url, headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end
end
