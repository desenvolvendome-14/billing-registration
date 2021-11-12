class AddBankAccountRefToBank < ActiveRecord::Migration[6.1]
  def change
    add_reference :banks, :bank_account, null: false, foreign_key: true
  end
end
