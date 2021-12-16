module Api
  module V1
    class AccountWalletsController < ApplicationController
      before_action :account_wallet, only: %i[show update destroy]

      def index
        @account_wallets = AccountWalletsFetcher.new(account_wallet_params).fetch
      end

      def create
        @account_wallet = AccountWallet.create(account_wallet_params)

        if @account_wallet.save
          render :create, status: :created
        else
          render json: @account_wallet.errors, status: :unprocessable_entity
        end
      end

      def update
        if @account_wallet.update(account_wallet_params)
          render :show, status: :ok
        else
          render json: @account_wallet.errors, status: :unprocessable_entity
        end
      end

      def show; end

      def destroy
        @account_wallet.destroy!
      rescue StandardError
        render json: @account_wallet.errors, status: :unprocessable_entity
      end

      private

      def account_wallet_params
        params.permit(:description)
      end

      def account_wallet
        @account_wallet = AccountWallet.find(params[:id])
      end
    end
  end
end
