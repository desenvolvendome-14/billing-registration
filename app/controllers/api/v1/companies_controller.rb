module Api
  module V1
    class CompaniesController < ApplicationController
      # POST api/v1/company
      def create
        @company = Company.create(company_params)
        if @company.save
          render :create, status: :created
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      def index
        @companies = Company.all
        render :index
      end

      private
      def company_params
        params.permit(:company_name, :state_registration, :cnpj, :fantasy_name, :business_phone)
      end
    end
  end
end

