# frozen_string_literal: true

module Admin
  class ChannelsController < ApplicationController
    include Authentication
    include Admin::Concerns::AdminAuthentication
    include CurrentChannel

    before_action :no_authentication
    before_action :check_admin
    before_action :current_channel

    def show
      respond_with channels_for_admin
    end

    private

    helper_method def channels_for_admin
      Channel.all
    end

    helper_method def members_for_channel
      current_channel.memberships.all.includes(:user)
    end
  end
end
