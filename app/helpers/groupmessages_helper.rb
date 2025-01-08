module GroupmessagesHelper
  def non_read_groupmessage
    Groupmessage.where(read: false).where.not(user_id: current_user.id).count
  end

  def non_read_groupmessage_by_group(group_id)
    Groupmessage.where(group_id: group_id, read: false).where.not(user_id: current_user.id).count
  end

end
