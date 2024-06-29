class ChannelsController < ApplicationController

  def index
    @channels=Channel.all
  end

  def new
    @channel=Channel.new
  end
    
  def create
    create_channel
    if @channel.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @channel=Channel.find(params[:id])
  end
    
  def update
    @channel=Channel.find(params[:id])
    if @channel.update(channel_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy
    redirect_to root_path
  end

  private

  def create_channel
    @channel = Channel.create(channel_params)
  end

  def channel_params
    params.require(:channel).permit(:name, :private)
  end

end
