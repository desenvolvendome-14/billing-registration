# frozen_string_literal: true

class CreateChartsAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :charts_accounts do |t|
      t.string :description
      t.string :internal_code

      t.timestamps
    end
  end
end
