module Api
  module V1
    class AddressesController < ApplicationController
      before_action :set_address, only: %i[update show destroy]

      def index
        @addresses = Address.all
      end

      def show; end

      def create
        @address = Address.new(address_params)

        if @address.save
          render :show, status: :created
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      end

      def update
        if @address.update(address_params)
          render json: @address, status: :ok
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @address.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_address
        @address = Address.find(params[:id])
      end

      def address_params
        params.require(:address).permit(:zip_code, :state, :city, :district, :complement, :street, :house_number,
                                        :company_id, :participant_id)
      end
    end
  end
end
