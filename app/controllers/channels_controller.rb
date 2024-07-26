# frozen_string_literal: true

class ChannelsController < ApplicationController
  include Authentication
  include CurrentChannel
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
    if @channel.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_channel
    @channel = Channel.create(channel_params)
  end

  def channel_params
    params.require(:channel).permit(:name, :private)
  end
end
