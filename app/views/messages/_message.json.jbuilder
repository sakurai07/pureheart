json.extract! message, :id, :user_id, :room_id, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
