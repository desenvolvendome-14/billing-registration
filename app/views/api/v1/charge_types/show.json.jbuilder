json.charge_type do
  json.id                                 @charge_type.id
  json.description                        @charge_type.description
  json.created_at                         @charge_type.created_at
  json.updated_at                         @charge_type.updated_at
end