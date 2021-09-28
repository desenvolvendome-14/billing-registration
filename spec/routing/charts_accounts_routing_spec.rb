# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChartsAccountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/charts_accounts").to route_to("charts_accounts#index")
    end

    it "routes to #show" do
      expect(get: "/charts_accounts/1").to route_to("charts_accounts#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/charts_accounts").to route_to("charts_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/charts_accounts/1").to route_to("charts_accounts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/charts_accounts/1").to route_to("charts_accounts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/charts_accounts/1").to route_to("charts_accounts#destroy", id: "1")
    end
  end
end
