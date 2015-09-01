json.array!(@congregations) do |congregation|
  json.extract! congregation, :id, :name, :number, :meeting_time, :meeting_day, :kh_address, :kh_phone
  json.url congregation_url(congregation, format: :json)
end
