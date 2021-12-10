module Api
  module V1
    class ParticipantsController < ApplicationController
      before_action :load_participant, only: %i[show update destroy]

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
      rescue StandardError
        render json: @participant.errors, status: :unprocessable_entity
      end

      def search
        @params = params[:name, :cpf_cnpj, :fantasy_name, :person_type, :client_type]
        @participant = Participant.where "name like ?", "%#{@params}%"
      end

      private

      def load_participant
        @participant = Participant.find(params[:id])
      end

      def participant_params
        return {} unless params.key?(:participant)

        params.require(:participant).permit(:name, :cpf_cnpj, :fantasy_name, :person_type, :client_type,
                                            :state_registration)
      end

      def save_participant!
        @participant.save!
        render :show
      rescue StandardError
        render json: @participant.errors, status: :unprocessable_entity
      end
    end
  end
end
