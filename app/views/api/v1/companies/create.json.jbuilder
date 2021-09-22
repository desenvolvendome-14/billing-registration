json.company do
  json.company_name                       @company.company_name
  json.cnpj                               @company.cnpj
  json.state_registration                 @company.state_registration
  json.fantasy_name                       @company.fantasy_name
  json.business_phone                     @company.business_phone
end
