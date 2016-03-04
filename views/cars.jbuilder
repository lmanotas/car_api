json.cars do
  json.array!(@cars) do |car|
    json.description car[:description]
    json.latitude car[:latitude]
    json.longitude car[:longitude]
  end
end