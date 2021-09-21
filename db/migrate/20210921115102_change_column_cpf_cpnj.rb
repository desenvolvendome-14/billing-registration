class ChangeColumnCpfCpnj < ActiveRecord::Migration[6.1]
  def change
    rename_column :participants, :cpf_cpnj, :cpf_cnpj
  end
end
