module Api
  module V1
    class BanksController < ApplicationController
      # POST api/v1/banks
      def create
        @bank = Bank.create(bank_params)

        if @bank.save
          render json: BankRepresenter.new(@bank).as_json, status: :created
        else
          render json: @bank.errors, status: :unprocessable_entity
        end
      end

      private

      def bank_params
        params.permit(:code, :description)
      end
    end
  end
end
