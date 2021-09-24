class CreateCostCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :cost_centers do |t|
      t.string :description

      t.timestamps
    end
  end
end
