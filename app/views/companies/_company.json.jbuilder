json.extract! company, :id, :uid, :name, :symbol, :sector, :insdustry, :country, :pnl, :created_at, :updated_at
json.url company_url(company, format: :json)
