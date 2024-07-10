# frozen_string_literal: true

module Admin
  class ChannelsController < ApplicationController
    include Authentication
    include Admin::Concerns::AdminAuthentication

    before_action :no_authentication
    before_action :check_admin

    def show
      @channels = Channel.all
      @channel = Channel.find(params[:id])
      @memberships = @channel.memberships.all
    end
  end
end
