class CreateChargeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :charge_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
