class RemoveBusinessPhoneFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :business_phone
  end
end
