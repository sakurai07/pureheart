class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def room_select(data)
    stream_from "room_channel_#{data['room_id']}"
  end

  def speak(data)
    Message.create! message: data['message'], user_id: data['user_id'], room_id: data['room_id']
  end

end
