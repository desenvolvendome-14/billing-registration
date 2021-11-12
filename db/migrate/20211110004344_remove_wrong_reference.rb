class RemoveWrongReference < ActiveRecord::Migration[6.1]
  def change
    remove_reference :banks, :bank_account
  end
end
