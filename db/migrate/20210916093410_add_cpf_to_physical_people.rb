class AddCpfToPhysicalPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :physical_people, :cpf, :string
  end
end
