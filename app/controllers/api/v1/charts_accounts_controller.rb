# frozen_string_literal: true

module Api
  module V1
    class ChartsAccountsController < ApplicationController
      before_action :set_charts_account, only: %i[show update destroy]

      # GET /charts_accounts
      # GET /charts_accounts.json
      def index
        @charts_accounts = ChartsAccount.all
      end

      # GET /charts_accounts/1
      # GET /charts_accounts/1.json
      def show; end

      # POST /charts_accounts
      # POST /charts_accounts.json
      def create
        @charts_account = ChartsAccount.new(charts_account_params)

        if @charts_account.save
          render :show, status: :created
        else
          render json: @charts_account.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /charts_accounts/1
      # PATCH/PUT /charts_accounts/1.json
      def update
        if @charts_account.update(charts_account_params)
          render json: @charts_account, status: :ok
        else
          render json: @charts_account.errors, status: :unprocessable_entity
        end
      end

      # DELETE /charts_accounts/1
      # DELETE /charts_accounts/1.json
      def destroy
        @charts_account.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_charts_account
        @charts_account = ChartsAccount.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def charts_account_params
        params.require(:charts_account).permit(:description, :internal_code)
      end
    end
  end
end
