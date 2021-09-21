require 'rails_helper'

RSpec.describe "Participants", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/participants/index"
      expect(response).to have_http_status(:success)
    end
  end

end
