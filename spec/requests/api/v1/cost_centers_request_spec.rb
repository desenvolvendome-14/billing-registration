require "rails_helper"

RSpec.describe "Api::V1::CostCenters", type: :request do
  let!(:cost_centers) { create_list(:cost_center, 5) }
  let(:cost_center_id) { cost_centers.first.id }

  describe "POST /api/v1/cost_centers" do
    # valid cost center
    let(:valid_params) { { description: "This is a cost center" } }

    context "when the request is valid" do
      before { post "/api/v1/cost_centers", params: valid_params }

      it "creates a cost center" do
        expect(body_json["cost_center"]["description"]).to eq("This is a cost center")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when the request is invalid" do
      before { post "/api/v1/cost_centers", params: { description: "" } }

      it "do not create a cost center" do
        expect(body_json["description"]).to eq(["can't be blank"])
      end

      it "returns status code 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /api/v1/cost_centers" do
    context "with no filters" do
      before { get "/api/v1/cost_centers" }

      it "returns cost_centers" do
        expect(body_json["cost_centers"]).not_to be_empty
        expect(body_json["cost_centers"].size).to eq(5)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with filters" do
      let!(:cost_center) { create(:cost_center, description: "teste") }

      before { get "/api/v1/cost_centers?description=#{cost_center.description}" }

      it "returns filtered cost centers" do
        expect(body_json["cost_centers"]).not_to be_empty
        expect(body_json["cost_centers"].size).to eq(1)
      end
    end
  end

  describe "PUT /cost_centers/:id" do
    let(:valid_attributes) { { description: "Saffron Swords" } }

    before { put "/api/v1/cost_centers/#{cost_center_id}", params: valid_attributes }

    context "when charge type exists" do
      it "returns status code 204" do
        expect(response).to have_http_status(:no_content)
      end

      it "updates the charge type" do
        updated_item = CostCenter.find(cost_center_id)
        expect(updated_item.description).to match(/Saffron Swords/)
      end
    end

    context "when the charge type does not exist" do
      let(:cost_center_id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(:not_found)
      end

      it "returns a not found message" do
        expect(response.body).to include("Couldn't find CostCenter with 'id'=0")
      end
    end
  end

  describe "DELETE /cost_centers/:id" do
    before { delete "/api/v1/cost_centers/#{cost_center_id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(:no_content)
    end
  end
end
