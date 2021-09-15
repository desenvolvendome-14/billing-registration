class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :state_registration
      t.string :company_name
      t.string :fantasy_name
      t.string :business_phone
      t.string :address

      t.timestamps
    end
  end
end
