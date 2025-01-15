module GroupmessagesHelper
  def non_read_groupmessage
    # Groupmessage.where(read: false).where.not(user_id: current_user.id).count
    # messages_helper　groupmembers_controllerを参考にしつつ書く

    # groupmembers = Groupmember.where("user_id=?", current_user.id)
    # non_read_messagecount = 0
    # member.each do |gm|
    #   non_read_messagecount = non_read_messagecount + Groupmessage.where(room_id: gm.room_id, read: false).where.not(user_id: current_user.id).count  
    # end
    # non_read_messagecount

  end

  def non_read_groupmessage_by_group(group_id)
    Groupmessage.where(group_id: group_id, read: false).where.not(user_id: current_user.id).count
  end

end
