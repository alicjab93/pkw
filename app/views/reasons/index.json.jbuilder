json.array!(@reasons) do |reason|
  json.extract! reason, :id, :label
  json.url reason_url(reason, format: :json)
end
