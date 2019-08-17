class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    MessageBroadcastService.call(message)
  end
end