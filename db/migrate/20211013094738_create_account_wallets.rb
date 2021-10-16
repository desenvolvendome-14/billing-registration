class CreateAccountWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :account_wallets do |t|
      t.string :description

      t.timestamps
    end
  end
end
