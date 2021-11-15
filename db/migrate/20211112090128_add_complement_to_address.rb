class AddComplementToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :complement, :string
  end
end
