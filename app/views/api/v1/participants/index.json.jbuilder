json.participants do
  json.array! @participants, :id, :name, :cpf_cnpj, :fantasy_name, :person_type, :client_type, :addresses
end
