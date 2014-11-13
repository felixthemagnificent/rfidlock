json.array!(@workers) do |worker|
  json.extract! worker, :id, :card, :name
  json.url worker_url(worker, format: :json)
end
