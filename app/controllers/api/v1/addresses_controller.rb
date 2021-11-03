module Api
  module V1
    class AddressesController < ApplicationController
      def index
        @addresses = Address.all
      end

      def create
        @address = Address.new(address_params)

        if @address.save
          render :show, status: :created
        else
          render json: @address.erros, status: :unprocessable_entity
        end
      end

      private
      def address_params
        params.require(:address).permit(:zip_code, :state, :city, :district, :complement, :street, :house_number,
                                        :company_id, :participant_id )
      end
    end
  end
end

