# frozen_string_literal: true

class MembershipsController < ApplicationController
  include Authentication
  include CurrentChannel
  include CreateResource
  before_action :no_authentication
  before_action :current_channel, only: %i[create destroy]

  def create
    create_membership
  end

  def destroy
    @membership = current_user.memberships.find_by!(channel_id: current_channel.id)
    @membership.destroy
    redirect_to root_path
  end

  private

  def create_membership
    @membership = current_channel.memberships.new(user: current_user)
    create_resource(@membership)
  end
end
