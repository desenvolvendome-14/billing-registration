module Api
  module V1
    class ChargeTypesController < ApplicationController
      before_action :set_charge_type, only: %w[show update destroy]

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

      def show; end

      def update
        @charge_type.update(charge_type_params)
        head :no_content
      end
      # DELETE /charge_types/:id
      def destroy
        @charge_type.destroy
        head :no_content
      end

      private

      def charge_type_params
        params.permit(:description)
      end

      def set_charge_type
        @charge_type = ChargeType.find(params[:id])
      end
    end
  end
end

