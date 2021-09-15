class CreateForeigns < ActiveRecord::Migration[6.1]
  def change
    create_table :foreigns do |t|
      t.string :name
      t.string :last_name
      t.string :cell_phone

      t.timestamps
    end
  end
end
