class AddTypeToParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :type, :integer
  end
end
