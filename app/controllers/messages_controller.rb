class MessagesController < ApplicationController

  def create
    create_message   
    render turbo_stream: turbo_stream.replace("new_message_form", partial: "messages/message_form") 
  end

  private

  def create_message
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.create(message_params.merge(user_id: current_user.id))
  end

  def message_params
    params.require(:message).permit(:body, :channel_id, :user_id)
  end

end
