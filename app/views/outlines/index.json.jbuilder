json.array!(@outlines) do |outline|
  json.extract! outline, :id, :title, :number
  json.url outline_url(outline, format: :json)
end
