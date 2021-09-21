class AddClientTypeToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :client_type, :integer
  end
end
