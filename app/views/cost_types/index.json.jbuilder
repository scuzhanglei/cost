json.array!(@cost_types) do |cost_type|
  json.extract! cost_type, :id, :name
  json.url cost_type_url(cost_type, format: :json)
end
