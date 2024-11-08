json.extract! groupmessage, :id, :user_id, :message, :group_id, :created_at, :updated_at
json.url groupmessage_url(groupmessage, format: :json)
