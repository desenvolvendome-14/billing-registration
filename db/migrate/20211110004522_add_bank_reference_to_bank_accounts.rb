class AddBankReferenceToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :bank_accounts, :bank, null: false, foreign_key: true
  end
end
