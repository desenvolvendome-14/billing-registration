json.company do
  json.id                                 @company.id
  json.company_name                       @company.company_name
  json.cnpj                               @company.cnpj
  json.state_registration                 @company.state_registration
  json.fantasy_name                       @company.fantasy_name
  json.created_at                         @company.created_at
  json.updated_at                         @company.updated_at
end
