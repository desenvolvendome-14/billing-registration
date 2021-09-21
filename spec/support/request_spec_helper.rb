module RequestSpecHelper
  def body_json(symbolize_keys: false)
    json = JSON.parse(response.body)
    symbolize_keys ? json.deep_symbolize_keys : json
  rescue
    return {}
  end
end