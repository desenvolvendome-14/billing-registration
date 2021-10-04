module Api
  module V1
    class CostCentersController < ApplicationController
      before_action :set_cost_center, only: %w[show]
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
        @cost_centers = @cost_centers.where(description: params[:description]) if params[:description]

        render :index
      end

      def show
        render :show
      end

      private

      def cost_center_params
        params.permit(:description)
      end

      def set_cost_center
        @cost_center = CostCenter.find(params[:id])
      end
    end
  end
end

