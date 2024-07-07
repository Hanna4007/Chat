class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_has_channels?, :last_channel

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_has_channels?
    current_user.channels.any?
  end

  def last_channel
    @last_message = current_user.messages.last
    @last_channel = @last_message&.channel
  end
end
