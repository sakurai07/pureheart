class Groupmessage < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groupmessage_read_checks, dependent: :destroy
  after_create_commit { GroupmessageBroadcastJob.perform_later self }

  after_create {create_read_check self}
  private

  def create_read_check(data)
    Groupmember.where(group_id: data.group_id).where.not(user_id: data.user_id).each do |member|
      GroupmessageReadCheck.create! group_id: member.group\id, user_id: member.user_id, groupmessage_id: data.id, read: false
    end
  end
end
