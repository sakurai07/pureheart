module GroupmembersHelper
  def open_groupmember_record(group_id)
    groupmembers = Groupmember.where(user_id: current_user.id, group_id: group_id).count
    if groupmembers == 0 
      return false
    else
      return true
    end
  end
end
