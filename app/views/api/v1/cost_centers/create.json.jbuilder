json.cost_center do
  json.id               @cost_center.id
  json.description      @cost_center.description
  json.created_at       @cost_center.created_at
  json.updated_at       @cost_center.updated_at
end
