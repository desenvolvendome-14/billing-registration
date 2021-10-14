class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :description
      t.string :city
      t.string :agency
      t.string :agency_digit
      t.string :account
      t.string :account_digit
      t.string :assignor

      t.timestamps
    end
  end
end
