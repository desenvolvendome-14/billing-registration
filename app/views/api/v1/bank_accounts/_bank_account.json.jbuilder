json.extract! bank_account, :id, :description, :city, :agency, :agency_digit, :account, :account_digit, :assignor, :created_at, :updated_at
json.url api_v1_bank_account_url(bank_account, format: :json)
