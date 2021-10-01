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
        @companies = @companies.where(company_name: params[:company_name]) if params[:company_name]
        @companies = @companies.where(cnpj: params[:cnpj]) if params[:cnpj]
        @companies = @companies.where(business_name: params[:business_name]) if params[:business_name]

        render :index
      end

      private
      def company_params
        params.permit(:company_name, :state_registration, :cnpj, :fantasy_name, :business_phone)
      end
    end
  end
end

