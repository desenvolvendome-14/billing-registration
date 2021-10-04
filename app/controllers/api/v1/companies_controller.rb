module Api
  module V1
    class CompaniesController < ApplicationController
      before_action :set_company, only: %w[show update]
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

      def show
        render :show
      end

      def update
        @company.update(company_params)
        head :no_content
      end

      private
      def company_params
        params.permit(:company_name, :state_registration, :cnpj, :fantasy_name, :business_phone)
      end

      def set_company
        @company = Company.find(params[:id])
      end
    end
  end
end

