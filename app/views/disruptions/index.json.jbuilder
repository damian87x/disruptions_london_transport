json.array!(@disruptions) do |disruption|
  json.extract! disruption, :id
  json.url disruption_url(disruption, format: :json)
end
