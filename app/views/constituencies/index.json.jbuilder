json.array!(@constituencies) do |constituency|
  json.extract! constituency, :id, :number, :mandates, :ballots, :voters, :province_id
  json.url constituency_url(constituency, format: :json)
end
