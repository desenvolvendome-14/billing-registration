class AddParticipantToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :participant, null: false, foreign_key: true
  end
end
