module Api
  module V1
    class BanksController < ApplicationController
      before_action :bank, only: %i[show update destroy]

      def index
        @banks = BanksFetcher.new(bank_params).fetch
      end

      def create
        @bank = Bank.create(bank_params)

        if @bank.save
          render :create, status: :created
        else
          render json: @bank.errors, status: :unprocessable_entity
        end
      end

      def show; end

      def destroy
        @bank.destroy!
      rescue StandardError
        render json: @bank.errors, status: :unprocessable_entity
      end

      private

      def bank_params
        params.permit(:code, :description)
      end

      def bank
        @bank = Bank.find(params[:id])
      end
    end
  end
end
