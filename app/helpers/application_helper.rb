# frozen_string_literal: true

module ApplicationHelper
  def user_has_channels?
    current_user.channels.any?
  end

  def last_channel
    last_message = current_user.messages.last
    last_message&.channel
  end
end
