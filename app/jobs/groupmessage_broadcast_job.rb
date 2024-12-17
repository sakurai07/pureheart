class GroupmessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast "group_channel_#{data.group_id}", message: render_message(data)
  end

  private
  def render_message(data)
    ApplicationController.renderer.render(partial: 'groupmessages/groupmessage', locals: { groupmessage: data })
  end

end
