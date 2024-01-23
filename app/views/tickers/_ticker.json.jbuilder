json.extract! ticker, :id, :symbol, :name, :market, :last_price, :last_price_at, :last_change_percent, :ask_size, :bid_size, :ask_price, :bid_price, :sector, :industry, :kind, :created_at, :updated_at
json.url ticker_url(ticker, format: :json)
