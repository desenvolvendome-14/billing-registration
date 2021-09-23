class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :cpf_cpnj
      t.string :fantasy_name

      t.timestamps
    end
  end
end
