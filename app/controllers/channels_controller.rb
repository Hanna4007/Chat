# frozen_string_literal: true

class ChannelsController < ApplicationController
  include Authentication
  include CurrentChannel
  include CreateResource
  before_action :no_authentication
  before_action :current_channel, only: [:show]

  def index
    @memberships_for_current_user = current_user.memberships

    @channels = Channel.where.not(id: @memberships_for_current_user.pluck(:channel_id))
  end

  def show
    @channels = current_user.channels

    @memberships = current_channel.memberships
    @memberships_for_user = current_user.memberships.includes(:channel)

    @messages = current_channel.messages.includes(:user)

    @message = Message.new
    respond_with current_channel
  end

  def new
    @channel = Channel.new
  end

  def create
    create_channel
  end

  private

  def create_channel
    @channel = Channel.new(channel_params)
    create_resource(@channel)
  end

  def channel_params
    params.require(:channel).permit(:name, :private)
  end
end
