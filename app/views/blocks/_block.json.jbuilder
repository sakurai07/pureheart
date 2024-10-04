json.extract! block, :id, :user_id, :blocked_user_id, :created_at, :updated_at
json.url block_url(block, format: :json)
