json.companies do
  json.array! @companies, :id, :company_name, :cnpj, :state_registration, :fantasy_name, :created_at, :updated_at
end
