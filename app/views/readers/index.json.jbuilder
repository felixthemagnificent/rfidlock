json.array!(@readers) do |reader|
  json.extract! reader, :id, :serial, :desc
  json.url reader_url(reader, format: :json)
end
