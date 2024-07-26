# frozen_string_literal: true

class MessagesController < ApplicationController
  include Authentication
  include CurrentChannel
  before_action :no_authentication
  before_action :current_channel

  def create
    unless current_channel.memberships.exists?(user_id: current_user.id)
      return render turbo_stream: turbo_stream.replace('new_message_form',
                                                       partial: 'messages/for_user_without_membership')
    end

    @message = current_channel.messages.create(message_params.merge(user_id: current_user.id))
    render turbo_stream: turbo_stream.replace('new_message_form', partial: 'messages/message_form')
  end

  private

  def message_params
    params.require(:message).permit(:body, :channel_id, :user_id)
  end
end
