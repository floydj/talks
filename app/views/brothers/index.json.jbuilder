json.array!(@brothers) do |brother|
  json.extract! brother, :id, :congregation_id, :first_name, :last_name, :phone, :email
  json.url brother_url(brother, format: :json)
end
