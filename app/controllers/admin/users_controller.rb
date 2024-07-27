# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    include Authentication
    include Admin::Concerns::AdminAuthentication

    before_action :no_authentication
    before_action :check_admin

    def show
      respond_with users_for_admin
    end

    private

    helper_method def users_for_admin
      User.all
    end

    helper_method def channels_for_user
      @user = User.find(params[:id])
      @user.channels
    end
  end
end
