class RemoveBankFromAddress < ActiveRecord::Migration[6.1]
  def change
    remove_reference :addresses, :bank, null: false, foreign_key: true
  end
end
