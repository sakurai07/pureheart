class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    # Do something later
    ActionCable.server.broadcast "room_channel_#{data.room_id}", message: render_message(data)
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: data})
  end

end
