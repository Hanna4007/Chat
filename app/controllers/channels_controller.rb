# frozen_string_literal: true

class ChannelsController < ApplicationController
  include Authentication
  include CurrentChannel
  
  before_action :no_authentication
  before_action :current_channel, only: [:show]
  
  def index
    memberships_for_user
    memberships_without_user
    respond_with memberships_for_user
  end

  def show
    respond_with current_channel
  end

  def new
    @channel = Channel.new
    respond_with(@channel)
  end

  def create
    create_channel
    respond_with(@channel, location: root_path)
  end

  private

  def create_channel
    @channel = Channel.create(channel_params)
  end

  def channel_params
    params.require(:channel).permit(:name, :private)
  end

  helper_method def memberships_for_user
    current_user.memberships.includes(:channel)
  end

  helper_method def memberships_without_user
    Channel.where.not(id: memberships_for_user.pluck(:channel_id))
  end

  helper_method def memberships_for_channel
    current_channel.memberships
  end

  helper_method def messages_for_channel
    current_channel.messages.includes(:user)
  end

end
