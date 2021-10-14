# frozen_string_literal: true

module Api
  module V1
    class BankAccountsController < ApplicationController
      before_action :set_bank_account, only: %i[show update destroy]

      # GET /bank_accounts
      # GET /bank_accounts.json
      def index
        @bank_accounts = BankAccount.all
      end

      # GET /bank_accounts/1
      # GET /bank_accounts/1.json
      def show; end

      # POST /bank_accounts
      # POST /bank_accounts.json
      def create
        @bank_account = BankAccount.new(bank_account_params)

        if @bank_account.save
          render :show, status: :created
        else
          render json: @bank_account.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /bank_accounts/1
      # PATCH/PUT /bank_accounts/1.json
      def update
        if @bank_account.update(bank_account_params)
          render :show, status: :ok
        else
          render json: @bank_account.errors, status: :unprocessable_entity
        end
      end

      # DELETE /bank_accounts/1
      # DELETE /bank_accounts/1.json
      def destroy
        @bank_account.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_bank_account
        @bank_account = BankAccount.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def bank_account_params
        params.require(:bank_account).permit(:description, :city, :agency, :agency_digit, :account, :account_digit,
                                             :assignor)
      end
    end
  end
end
