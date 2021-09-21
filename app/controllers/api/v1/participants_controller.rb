module Api
  module V1
    class ParticipantsController < ApplicationController
      before_action :load_participant, only: [:show, :update, :destroy]

      def index
        @participants = Participant.all
      end

      def create
        @participant = Participant.new
        @participant.attributes = participant_params
        save_participant!
      end

      def show; end

      def update
        @participant.attributes = participant_params
        save_participant!
      end

      def destroy
        @participant.destroy!
      rescue
        render json: @participant.errors, status: :unprocessable_entity
      end

      private

      def load_participant
        @participant = Participant.find(params[:id])
      end

      def participant_params
        params.permit(:name, :cpf_cnpj, :fantasy_name, :person_type, :client_type)
      end

      def save_participant!
        @participant.save!
        render :show
      rescue
        render json: @participant.errors, status: :unprocessable_entity
      end
    end
  end
end

