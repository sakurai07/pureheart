module MessagesHelper
  def non_read_message
    member = Member.where("user_id=?", current_user.id)
    non_read_messagecount = 0
    member.each do |m|
      non_read_messagecount = non_read_messagecount + Message.where(room_id: m.room_id, read: false).where.not(user_id: current_user.id).count  
    end
    non_read_messagecount
  end

  def non_read_message_by_user(user_id)
    member = Member.where("user_id=?", current_user.id)
    non_read_messagecount = 0
    member.each do |m|
      non_read_messagecount = non_read_messagecount + Message.where(room_id: m.room_id, user_id: user_id, read: false).count
    end
    non_read_messagecount
  end
  
end