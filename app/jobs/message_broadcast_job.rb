class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "groups_#{message.group.id}_channel",
      message: render_message(message)
  end

  private

    def render_message(message)
      MessagesController.render partial: 'messages/newmessage', locals: {message: message}
    end
end