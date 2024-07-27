# frozen_string_literal: true

module LastChannel
  extend ActiveSupport::Concern
  included do
    helper_method :user_has_channels?, :last_channel
  end

  def user_has_channels?
    current_user.channels.any?
  end

  def last_channel
    user_has_channels? ? find_last_channel : nil
  end

  private

  def last_channel_by_time
    current_user.channels.last
  end

  def find_last_channel
    last_channel = if current_user.messages.any?
                     last_message = current_user.messages.last
                     last_message.channel
                   else
                     last_channel_by_time
                   end

    last_channel.memberships.exists?(user_id: current_user.id) ? last_channel : last_channel_by_time
  end
end
