json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :real_time, :desc, :cost_type_id, :price
  json.url entry_url(entry, format: :json)
end
