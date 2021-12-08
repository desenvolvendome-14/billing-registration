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

      def search
        @params = params[:name, :cpf_cnpj, :fantasy_name, :person_type, :client_type]
        @participant = Participant.where "name like ?", "%#{@params}%"
      end

      private

      def load_participant
        @participant = Participant.find(params[:id])
      end

      def participant_params
        return {} unless params.has_key?(:participant)
        params.require(:participant).permit(:name, :cpf_cnpj, :fantasy_name, :person_type, :client_type, :state_registration,
                                            addresses_attributes: [ :zip_code, :state, :city, :district, :street, :house_number ])
      end

      def save_participant!
        @participant.save
        render :show
      rescue
        render json: @participant.errors, status: :unprocessable_entity
      end
    end
  end
end

