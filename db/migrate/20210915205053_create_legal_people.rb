class CreateLegalPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :legal_people do |t|
      t.string :corporate_name
      t.string :fantasy_name
      t.string :state_registration
      t.string :municipal_registration
      t.string :cell_phone

      t.timestamps
    end
  end
end
