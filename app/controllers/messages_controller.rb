class MessagesController < ApplicationController

  def create
    create_message
    
    if @message.valid?
      redirect_to my_channels_show_path(@channel.id) 
    else
      render :new, status: :unprocessable_entity
    end
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
