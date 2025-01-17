module MembersHelper
  def open_member_record(followed_user_id)
    members = Member.where(user_id: current_user.id)
    members.each do |member|
      record = Member.find_by(user_id: followed_user_id, room_id: member.room_id)
      unless record.nil?
        return record
      end
    end
    return nil
  end

  def check_follower(followed_user_id)
    follow = Follow.find_by(user_id: followed_user_id , followed_user_id: current_user.id)
    if follow.nil?
      return false
    else
      return true
    end
  end

end
