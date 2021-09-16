module Api
  module V1
    class CompaniesController < ApplicationController
      # POST /company
      def create
        @company = Company.create(company_params)
        if @company.save
          render json: CompanyRepresenter.new(@company).as_json, status: :created
        else
          render json: @company.errors, status: :unprocessable_entity
        end
      end

      private
      def company_params
        params.permit(:company_name, :state_registration, :cnpj, :fantasy_name, :business_phone)
      end
    end
  end
end

