module Api
  module V1
    class CostCentersController < ApplicationController
      # POST api/v1/cost center
      def create
        @cost_center = CostCenter.create(cost_center_params)
        if @cost_center.save
          render :create, status: :created
        else
          render json: @cost_center.errors, status: :unprocessable_entity
        end
      end

      def index
        @cost_centers = CostCenter.all

        render :index
      end

      private
      def cost_center_params
        params.permit(:description)
      end
    end
  end
end

