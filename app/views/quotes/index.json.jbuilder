json.array!(@quotes) do |quote|
  json.extract! quote, :id, :id, :quote
  json.url quote_url(quote, format: :json)
end
