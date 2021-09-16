class AddCompanyToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :company, null: false, foreign_key: true
  end
end
