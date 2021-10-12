json.charge_types do
  json.array! @charge_types, :id, :description, :created_at, :updated_at
end
