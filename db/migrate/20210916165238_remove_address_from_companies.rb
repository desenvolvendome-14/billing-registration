class RemoveAddressFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :address
  end
end
