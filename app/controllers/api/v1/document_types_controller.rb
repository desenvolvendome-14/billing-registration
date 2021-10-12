# frozen_string_literal: true

module Api
  module V1
    class DocumentTypesController < ApplicationController
      before_action :set_document_type, only: %i[show update destroy]

      # GET /document_types
      # GET /document_types.json
      def index
        @document_types = DocumentType.all
        @document_types = @document_types.where(description: params[:description]) if params[:description]
      end

      # GET /document_types/1
      # GET /document_types/1.json
      def show; end

      # POST /document_types
      # POST /document_types.json
      def create
        @document_type = DocumentType.new(document_type_params)

        if @document_type.save
          render :show, status: :created
        else
          render json: @document_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /document_types/1
      # PATCH/PUT /document_types/1.json
      def update
        if @document_type.update(document_type_params)
          render :show, status: :ok
        else
          render json: @document_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /document_types/1
      # DELETE /document_types/1.json
      def destroy
        @document_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_document_type
        @document_type = DocumentType.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def document_type_params
        params.require(:document_type).permit(:description)
      end
    end
  end
end
