# frozen_string_literal: true

class ChannelsController < ApplicationController
  include Authentication
  before_action :no_authentication

  def index
    @channels = Channel.all

    @channel_memberships = {}
    @channels.each do |channel|
      @channel_memberships[channel.id] = if current_user.channels.include?(channel)
                                           current_user.memberships.find_by(channel_id: channel.id)
                                         else
                                           channel.memberships.new(user_id: current_user.id)
                                         end
    end
  end

  def show
    @channels = current_user.channels

    @channel = Channel.find(params[:id])
    @memberships = @channel.memberships
    @memberships_for_user = current_user.memberships.includes(:channel) 

    @messages = @channel.messages.includes(:user)

    @message = Message.new
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

  def edit
    @channel = Channel.find(params[:id])
  end

  def update
    @channel = Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to root_path
  end

  private

  def create_channel
    @channel = Channel.create(channel_params)
  end

  def channel_params
    params.require(:channel).permit(:name, :private)
  end
end
