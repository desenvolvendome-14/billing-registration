class AddPassportToForeigns < ActiveRecord::Migration[6.1]
  def change
    add_column :foreigns, :passport, :string
  end
end
