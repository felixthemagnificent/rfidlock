json.array!(@options) do |option|
  json.extract! option, :id, :card, :reader_id
  json.url option_url(option, format: :json)
end
