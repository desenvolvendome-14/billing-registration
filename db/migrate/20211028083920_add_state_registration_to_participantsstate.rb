class AddStateRegistrationToParticipantsstate < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :state_registration, :string
  end
end
