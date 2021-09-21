class ChangeColumnPersonType < ActiveRecord::Migration[6.1]
  def change
    rename_column :participants, :type, :person_type
  end
end
