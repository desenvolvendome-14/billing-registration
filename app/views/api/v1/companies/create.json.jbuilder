json.company do
  json.company_name                       @company.company_name
  json.cnpj                               @company.cnpj
  json.state_registration                 @company.state_registration
  json.fantasy_name                       @company.fantasy_name
  json.business_phone                     @company.business_phone
  json.created_at                         @company.created_at
  json.updated_at                         @company.updated_at
end
