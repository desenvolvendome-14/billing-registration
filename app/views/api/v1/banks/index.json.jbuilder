json.banks do
  json.array! @banks, :id, :code, :description, :created_at, :updated_at, :address_id
end
