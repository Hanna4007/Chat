# frozen_string_literal: true

class MembershipsController < ApplicationController
  include Authentication
  include CurrentChannel
  before_action :no_authentication
  before_action :current_channel, only: %i[new create destroy]

  def new
    @membership = current_channel.memberships.new
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
    @membership = current_user.memberships.find_by!(channel_id: current_channel.id)
    @membership.destroy
    redirect_to root_path
  end

  private

  def create_membership
    @membership = current_channel.memberships.create(user: current_user)
  end
end
