# frozen_string_literal: true

module CurrentChannel
  extend ActiveSupport::Concern
  included do
    helper_method :current_channel
  end

  def current_channel
    Channel.find(params[:channel_id] || params[:id])
  end
end
