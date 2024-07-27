# frozen_string_literal: true

class UsersController < ApplicationController
  include Authentication

  before_action :authentication, only: %i[new create]
  before_action :no_authentication, only: %i[edit update]

  def new
    @user = User.new
    respond_with(@user)
  end

  def create
    create_user
    session[:user_id] = @user.id if @user.valid?
    respond_with(@user, location: root_path)
  end

  def edit; end

  def update
    current_user.update(user_params)
    respond_with(current_user, location: root_path)
  end

  private

  def create_user
    @user = User.create(user_params)
  end

  def user_params
    params.require(:user).permit(:login, :phone_number, :password, :password_confirmation)
  end
end
