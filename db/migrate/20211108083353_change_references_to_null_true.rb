class ChangeReferencesToNullTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_null :addresses, :participant_id, true
    change_column_null :addresses, :company_id, true
  end
end
