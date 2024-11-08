json.extract! groupmember, :id, :user_id, :group_id, :created_at, :updated_at
json.url groupmember_url(groupmember, format: :json)
