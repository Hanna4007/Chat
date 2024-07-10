# frozen_string_literal: true

class MembershipsController < ApplicationController
  def index
    @channel = Channel.find(params[:channel_id])
    @memberships = @channel.memberships
  end

  def new
    @channel = Channel.find(params[:channel_id])
    @membership = @channel.memberships.new
  end

  def create
    create_membership

    if @membership.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @channel = Channel.find(params[:channel_id])
    @membership = current_user.memberships.find_by(channel_id: @channel.id)
    @membership.destroy
    redirect_to root_path
  end

  private

  def create_membership
    @channel = Channel.find(params[:channel_id])
    @membership = @channel.memberships.create(user: current_user)
  end
end
