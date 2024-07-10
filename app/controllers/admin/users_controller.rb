# frozen_string_literal: true

module Admin
class UsersController < ApplicationController
  include Authentication
  include Admin::Concerns::AdminAuthentication
 
  before_action :no_authentication
  before_action :check_admin

  def show
    @users = User.all
    @user = User.find(params[:id])
    @channels = @user.channels    
  end

  end
end
