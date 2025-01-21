module GroupmessagesHelper
  def non_read_groupmessage
    # Groupmessage.where(read: false).where.not(user_id: current_user.id).count

    groupmember = Groupmember.where("user_id=?", current_user.id)
    non_read_messagecount = 0
    groupmember.each do |gm|
      non_read_messagecount = non_read_messagecount + Groupmessage.where(group_id: gm.group_id, read: false).where.not(user_id: current_user.id).count  
    end
    non_read_messagecount

  end

  def non_read_groupmessage_by_group(group_id)
    # Groupmessage.where(group_id: group_id, read: false).where.not(user_id: current_user.id).count
  
    groupmember = Groupmember.where("user_id=?", current_user.id)
    non_read_messagecount = 0
    groupmember.each do |gm|
      non_read_messagecount = non_read_messagecount + Groupmessage.where(group_id: gm.group_id, read: false).count
    end
    non_read_messagecount
  end

end
