json.extract! candle, :id, :ticker, :size, :candle_time, :open, :high, :low, :close, :volume, :created_at, :updated_at
json.url candle_url(candle, format: :json)
