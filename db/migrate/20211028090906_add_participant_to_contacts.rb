class AddParticipantToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :participant, null: false, foreign_key: true
  end
end
