module MessagesHelper
  def non_read_message
    Message.where(read: false).where.not(user_id: current_user.id).count
  end

  def non_read_message_by_user(user_id)
    Message.where(user_id: user_id, read: false).count
  end
  
end
