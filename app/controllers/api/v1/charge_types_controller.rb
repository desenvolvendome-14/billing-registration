module Api
  module V1
    class ChargeTypesController < ApplicationController
      # POST api/v1/cost center
      def create
        @charge_type = ChargeType.create(charge_type_params)
        if @charge_type.save
          render :create, status: :created
        else
          render json: @charge_type.errors, status: :unprocessable_entity
        end
      end

      def index
        @charge_types = ChargeType.all
        @charge_types = @charge_types.where(description: params[:description]) if params[:description]

        render :index
      end

      private
      def charge_type_params
        params.permit(:description)
      end
    end
  end
end

