json.array!(@permissions) do |permission|
  json.extract! permission, :id, :user_id, :reader_id
  json.url permission_url(permission, format: :json)
end
