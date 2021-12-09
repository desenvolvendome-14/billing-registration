json.account_wallets do
  json.array! @account_wallets, :id, :description, :created_at, :updated_at
end
