# frozen_string_literal: true

class MembershipsController < ApplicationController
  include Authentication
  include CurrentChannel
  
  before_action :no_authentication
  before_action :current_channel, only: %i[create destroy]

  def create
    create_membership
    respond_with(@membership, location: root_path)
  end

  def destroy
    @membership = current_user.memberships.find_by!(channel_id: current_channel.id)
    @membership.destroy
    respond_with(@membership, location: root_path)
  end

  private

  def create_membership
    @membership = current_channel.memberships.create(user: current_user)
  end
end
