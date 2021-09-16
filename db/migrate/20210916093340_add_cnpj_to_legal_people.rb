class AddCnpjToLegalPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :legal_people, :cnpj, :string
  end
end
