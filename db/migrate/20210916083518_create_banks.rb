class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.integer :code
      t.string :description

      t.timestamps
    end
  end
end
