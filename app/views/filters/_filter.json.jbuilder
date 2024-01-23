json.extract! filter, :id, :user_id, :name, :price_conditions, :volume_conditions, :fundamental_conditions, :pattern_conditions, :indicator_conditions, :email_notification, :created_at, :updated_at
json.url filter_url(filter, format: :json)
