json.extract! article, :id, :feed_id, :title, :message, :guid, :symbol, :created_at, :updated_at
json.url article_url(article, format: :json)
