class Groupmessage < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_create_commit { GroupmessageBroadcastJob.perform_later self }
end
