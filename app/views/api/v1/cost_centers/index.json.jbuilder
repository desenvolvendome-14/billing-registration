json.cost_centers do
  json.array! @cost_centers, :id, :description, :created_at, :updated_at
end
