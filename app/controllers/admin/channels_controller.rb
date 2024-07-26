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
      @channels = Channel.all
      current_channel = Channel.find(params[:id])
      @memberships = current_channel.memberships.all
    end
  end
end
