class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :email
      t.integer :status

      t.timestamps
    end
  end
end
