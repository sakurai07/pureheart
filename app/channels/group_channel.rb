class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def group_select(data)
    stream_from "group_channel_#{data['group_id']}"
  end

  def speak(data)
    Groupmessage.create! message: data['message'], user_id: data['user_id'],group_id: data['group_id']
  end
end
